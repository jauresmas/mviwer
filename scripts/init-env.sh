#!/usr/bin/env bash
# Crée le fichier .env à partir de .env.example avec des mots de passe aléatoires.
# N'écrase jamais un .env existant. Les mots de passe ne sont pas affichés.
#
# Usage (bash / Git Bash, depuis la racine du dépôt) :
#   bash scripts/init-env.sh
set -euo pipefail
cd "$(dirname "$0")/.."

if [ -f .env ]; then
  echo ".env existe déjà : rien à faire."
  exit 0
fi

gen() { openssl rand -base64 32 | tr -dc 'A-Za-z0-9' | head -c 24; }

sed -e "s/^GEOSERVER_ADMIN_PASSWORD=.*/GEOSERVER_ADMIN_PASSWORD=$(gen)/" \
    -e "s/^PG_GEOSERVER_PASSWORD=.*/PG_GEOSERVER_PASSWORD=$(gen)/" \
    .env.example > .env

echo ".env créé avec des mots de passe aléatoires (consulte le fichier pour les voir)."
