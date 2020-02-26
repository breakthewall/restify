#!/bin/bash

mode=$1

MODE=$mode DIR="$PWD" docker-compose -f dockerfiles/docker-compose.yml up

MODE=$mode DIR="$PWD" docker-compose -f dockerfiles/docker-compose.yml down -v
