#!/bin/bash

#mode=$1
mode=redis

source .env

MODE=$mode TOOL_NAME=$TOOL docker-compose up --build rest

MODE=$mode TOOL_NAME=$TOOL docker-compose down -v
