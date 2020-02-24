#!/bin/bash

# 'flask' or 'redis'
#mode=$1
mode=redis

source ../.env

MODE=$mode TOOL=$TOOL docker-compose -f ../docker-compose.yml up --build -d rest


sleep 5

docker run --rm \
  --link ${TOOL}_$mode:${TOOL}_$mode \
  -v $PWD/../${TOOL}-rest/test:/home \
  -w /home \
  --net ${TOOL} \
python:3 bash -c \
  "pip install --upgrade pip \
&& pip install requests \
&& /home/run.sh -server_url http://${TOOL}-rest_${mode}:8888/REST"


MODE=$mode TOOL=$TOOL docker-compose down -v
