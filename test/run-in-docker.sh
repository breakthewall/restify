#!/bin/bash

# 'flask' or 'redis'
#mode=$1
mode=redis

source ../tofill/.env

MODE=$mode docker-compose up -d rest


sleep 5

source ../tofill/test/command

docker run --rm \
  --link ${TOOL}_$mode:${TOOL}_$mode \
  -v $PWD:$PWD \
  -w $PWD \
  --net ${TOOL} \
python:3 bash -c \
  "pip install --upgrade pip \
&& pip install requests \
&& ${COMMAND} http://${TOOL}-rest_${mode}:8888/REST"


IMAGE_TAG=$mode docker-compose down -v
