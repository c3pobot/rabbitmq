#!/bin/bash
tag='c3pobot/rabbitmq'

docker build -t "ghcr.io/${tag}:latest" .
docker push "ghcr.io/${tag}:latest"
