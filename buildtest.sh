#!/bin/bash
file1=$(head -n 1 .testregistry)
tag='c3po/rabbitmq'
if [[ "$file1" ]]
then
  echo 'personal registry set'
  registry="${file1%%[[:cntrl:]]}"
else
  registry="ghcr.io"
  echo "using ghcr.io for test build"
fi
container="${registry}/${tag}:test"
echo building $container
docker build -t $container .
docker push $container
