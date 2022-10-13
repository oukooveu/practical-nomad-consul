#!/bin/bash
set -euo pipefail

docker-compose down
docker-compose up -d
curl --request PUT --data @external-services/postgres.json 172.16.1.101:8500/v1/catalog/register

nomad job run jobs/cli-jobs/petclinic-web.nomad
nomad job run jobs/cli-jobs/petclinic-egw.nomad
nomad job run jobs/cli-jobs/petclinic-api.nomad
nomad job run jobs/cli-jobs/petclinic-ingw.nomad

for i in consul-config/intention-*; do consul config write $i; done
