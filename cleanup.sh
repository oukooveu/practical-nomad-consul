#!/bin/bash

for app in $(nomad status | grep -v ^ID | awk '{print $1}'); do
  nomad stop -purge "$app"
done
docker-compose down
