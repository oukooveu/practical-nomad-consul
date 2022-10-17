#!/bin/bash
rundir=$(cd $(dirname "$0") && pwd)
docker run -d --rm \
    -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home \
    --name jenkins jenkins:local
docker cp "${rundir}/.terraformrc" jenkins:/var/jenkins_home
