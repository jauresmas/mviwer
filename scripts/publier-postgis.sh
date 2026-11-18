#!/usr/bin/env bash
# Publie toutes les tables géométriques d'un schéma PostGIS dans le GeoServer de la pile mviewer.
#
# Usage (bash / Git Bash, depuis la racine du dépôt) :
#   bash scripts/publier-postgis.sh <base> [schema=public] [espace_de_travail=<base>]
# Exemple :
#   bash scripts/publier-postgis.sh zan_rouen zan
# Variables facultatives : PG_HOST (défaut host.docker.internal), PG_PORT (5432), GEOSERVER_URL.
#
# Prérequis pour une NOUVELLE base : le rôle "geoserver" doit pouvoir s'y connecter.
#   psql -U postgres -c "GRANT CONNECT ON DATABASE <base> TO geoserver;"
# (la lecture des tables est déjà couverte par le rôle pg_read_all_data).
#
# Le script est idempotent : relancé, il ne publie que les tables pas encore publiées.
set -euo pipefail
cd "$(dirname "$0")/.."
set -a; . ./.env; set +a

DB="${1:?Usage : publier-postgis.sh <base> [schema] [espace_de_travail]}"
SCHEMA="${2:-public}"
WS="${3:-$DB}"
DS="pg_${DB}_${SCHEMA}"
GS_BASE="${GEOSERVER_URL:-http://127.0.0.1:8096/geoserver}"
GS="$GS_BASE/rest"
# PostgreSQL vu depuis le conteneur GeoServer (par défaut : la machine hôte)
PG_HOST="${PG_HOST:-host.docker.internal}"
PG_PORT="${PG_PORT:-5432}"
AUTH="$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASSWORD"

code() { curl -s -u "$AUTH" -o /dev/null -w "%{http_code}" "$@"; }
post_xml() { curl -s -u "$AUTH" -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: text/xml" --data-binary @- "$1"; }

# 1. Espace de travail
if [ "$(code "$GS/workspaces/$WS")" != 200 ]; then
  echo "<workspace><name>$WS</name></workspace>" | post_xml "$GS/workspaces" >/dev/null
  echo "Espace de travail créé : $WS"
fi

# 2. Entrepôt PostGIS (PostgreSQL Windows joint depuis Docker via host.docker.internal)
if [ "$(code "$GS/workspaces/$WS/datastores/$DS")" != 200 ]; then
  post_xml "$GS/workspaces/$WS/datastores" >/dev/null <<EOF
<dataStore>
  <name>$DS</name>
  <description>PostGIS $DB.$SCHEMA ($PG_HOST:$PG_PORT)</description>
  <connectionParameters>
    <entry key="dbtype">postgis</entry>
    <entry key="host">$PG_HOST</entry>
    <entry key="port">$PG_PORT</entry>
    <entry key="database">$DB</entry>
    <entry key="schema">$SCHEMA</entry>
    <entry key="user">$PG_GEOSERVER_USER</entry>
    <entry key="passwd">$PG_GEOSERVER_PASSWORD</entry>
    <entry key="Expose primary keys">true</entry>
    <entry key="Estimated extends">true</entry>
    <entry key="Loose bbox">true</entry>
    <entry key="encode functions">true</entry>
  </connectionParameters>
</dataStore>
EOF
  echo "Entrepôt créé : $WS:$DS"
fi

# 3. Publication des tables pas encore publiées
tables=$(curl -s -u "$AUTH" "$GS/workspaces/$WS/datastores/$DS/featuretypes.xml?list=available" \
  | grep -o '<featureTypeName>[^<]*</featureTypeName>' | sed -E 's#</?featureTypeName>##g' || true)
if [ -z "$tables" ]; then
  echo "Aucune nouvelle table à publier dans $DB.$SCHEMA."
fi
for t in $tables; do
  title=$(echo "$t" | sed -E 's/_/ /g; s/^(.)/\U\1/')
  c=$(echo "<featureType><name>$t</name><nativeName>$t</nativeName><title>$title</title></featureType>" \
      | post_xml "$GS/workspaces/$WS/datastores/$DS/featuretypes")
  echo "  $WS:$t -> HTTP $c"
done

echo
echo "WMS pour mviewer : ${GS_BASE/127.0.0.1/localhost}/$WS/wms"
