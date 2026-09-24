#!/usr/bin/env bash
set -Eeuo pipefail
cd /var/www/perso
docker compose -p perso -f docker-compose.yml config --quiet
docker compose -p perso -f docker-compose.yml exec -T nginx nginx -s reload
curl --fail --silent --show-error --retry 8 --retry-delay 2 --retry-all-errors --max-time 10 https://samuelcorchia.duckdns.org/ -o /dev/null
