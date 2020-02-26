#!/bin/bash

tool_name=$1

echo "
TOOL_TAG=master
TOOL="$tool_name > .env
#
# # FLask
# cat .env > dockerfiles/flask.env
# echo "REST_MODE=flask" >> dockerfiles/flask.env
#
# # Redis
# cat .env > dockerfiles/redis.env
# echo "REST_MODE=redis" >> dockerfiles/redis.env
