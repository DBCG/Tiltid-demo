#!/usr/bin/env bash

docker network create postgres
docker run -d --name=postgrestemp --network-alias=postgres --network=postgres postgres
docker build ./Docker -f ./Docker/Dockerfile -t tiltid --network=postgres
docker contianer -rm -f postgrestemp
docker network delete postgres



 docker run --network=postgres -p 8081:80 --name tiltid  tiltid:latest