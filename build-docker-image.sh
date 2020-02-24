#!/bin/bash

mode=$1

source .env

docker build --build-arg mode=$mode --build-arg TOOL=$TOOL -t brsynth/${TOOL}-rest:$mode .
