#!/bin/bash

TAG="latest"

docker build -t wikipedia-clickstream:$TAG -f Dockerfile .
