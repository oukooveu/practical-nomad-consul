#!/bin/bash
set -euo pipefail

[ -d "${1:-}" ] || exit 1

docker-compose down
docker-compose up -d
curl --request PUT --data @external-services/postgres.json 172.16.1.101:8500/v1/catalog/register

find "$1" -name '*.nomad' -type f -exec nomad job run -detach {} \;

#for i in consul-config/intention-*; do consul config write $i; done
