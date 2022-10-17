#!/bin/bash
docker run -d --rm --name artifactory \
    -p 9082:8082 -p 9081:8081 \
    -v artifactory-data:/var/opt/jfrog/artifactory \
    releases-docker.jfrog.io/jfrog/artifactory-oss:latest
