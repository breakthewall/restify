#!/bin/bash

mode=$1

DIR=$PWD docker-compose -f dockerfiles/docker-compose.yml up $mode

DIR=$PWD docker-compose -f dockerfiles/docker-compose.yml down -v
