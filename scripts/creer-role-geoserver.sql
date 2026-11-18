-- Crée le rôle PostgreSQL en lecture seule utilisé par GeoServer.
--
-- Usage (le mot de passe vient du fichier .env, il n'apparaît pas dans la commande) :
--   bash :   set -a; . ./.env; set +a
--            psql -h localhost -U postgres -d postgres -v pw="$PG_GEOSERVER_PASSWORD" -f scripts/creer-role-geoserver.sql
--
-- pg_read_all_data (PostgreSQL 14+) donne la lecture de toutes les tables de toutes les bases,
-- sans aucun droit d'écriture. Si tu préfères limiter à certaines bases/schémas, remplace-le par
-- des GRANT USAGE ON SCHEMA ... / GRANT SELECT ON ALL TABLES IN SCHEMA ... dans chaque base.

CREATE ROLE geoserver LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD :'pw';
GRANT pg_read_all_data TO geoserver;
COMMENT ON ROLE geoserver IS 'Lecture seule pour GeoServer (pile mviewer)';

-- Pour chaque base à publier, si elle n'accorde pas CONNECT à tout le monde :
--   GRANT CONNECT ON DATABASE ma_base TO geoserver;
