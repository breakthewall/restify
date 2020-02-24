#!/bin/bash

#mode=$1
mode=redis

source .env

MODE=$mode TOOL_NAME=$TOOL PATH=$PWD docker-compose up --build rest

MODE=$mode TOOL_NAME=$TOOL PATH=$PWD docker-compose down -v
