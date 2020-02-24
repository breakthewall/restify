#!/bin/bash

mode=$1

source .env

docker build --build-arg mode=$mode -t brsynth/${TOOL}-rest:$mode -f dockerfile .
