#!/bin/bash

tool_name=$1

echo "
TOOL_TAG=stable
TOOL="$tool_name > .env

cp .env test/.env
