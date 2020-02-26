#!/bin/bash

# 'flask' or 'redis'
#mode=$1
mode=redis

source ../.env

MODE=$mode TOOL=$TOOL DIR="$PWD/.." docker-compose -f ../docker-compose.yml up --build -d rest


sleep 5

docker run --rm \
  --link ${TOOL}_$mode:${TOOL}_$mode \
  -v $PWD/../tofill/test:/home \
  -w /home \
  --net ${TOOL} \
python:3 bash -c \
  "pip install --upgrade pip \
&& pip install requests \
&& python3 RestQuery.py `tr -d '\n' < ../tofill/test/args.txt` -server_url http://${TOOL}-rest_${mode}:8888/REST"


MODE=$mode TOOL=$TOOL DIR="$PWD/.." docker-compose down -v
