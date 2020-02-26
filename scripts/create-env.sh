#!/bin/bash

tool_name=$1

echo "
TOOL_TAG=master
TOOL="$tool_name > dockerfiles/.env

# FLask
cat dockerfiles/.env > flask.env
echo "REST_MODE=flask" >> flask.env

# Redis
cat dockerfiles/.env > redis.env
echo "REST_MODE=redis" >> redis.env
