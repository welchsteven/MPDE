#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
fi

export DOCKER_BUILDKIT=1
docker buildx create --use --name=qemu
docker buildx inspect --bootstrap

if [ "$1" = "push" ];
  then 
     docker buildx build --platform linux/amd64,linux/arm64 --push --tag welchsteven/vagrant-provider:ubuntu ./Ubuntu
   else  
     docker buildx build --platform linux/amd64,linux/arm64 --tag welchsteven/vagrant-provider:ubuntu ./Ubuntu
fi

