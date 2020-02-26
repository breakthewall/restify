#!/bin/bash

mode=$1

MODE=$mode docker-compose -f dockerfiles/docker-compose.yml up

MODE=$mode docker-compose -f dockerfiles/docker-compose.yml down -v
