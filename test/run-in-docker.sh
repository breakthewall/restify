#!/bin/bash

# 'flask' or 'redis'
mode=$1

source .env

#MODE=$mode TOOL=$TOOL DIR="$PWD/.." docker-compose -f ../docker-compose.yml up --build -d rest
MODE=$mode DIR="$PWD/.." docker-compose -f ../dockerfiles/docker-compose.yml up -d



sleep 5

docker run --rm \
  --link ${TOOL}_$mode:${TOOL}_$mode \
  -v $PWD/../tofill/test:/home \
  -w /home \
  --net ${TOOL} \
python:3 bash -c \
  "pip install --upgrade pip \
&& pip install requests \
&& python3 RestQuery.py `tr '\r\n' ' ' < ../tofill/test/args.txt` -server_url http://${TOOL}-rest_${mode}:8888/REST"


#MODE=$mode TOOL=$TOOL DIR="$PWD/.." docker-compose down -v
MODE=$mode docker-compose -f ../dockerfiles/docker-compose.yml down -v
