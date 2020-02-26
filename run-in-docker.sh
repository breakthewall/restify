#!/bin/bash

mode=$1

MODE=$mode TOOL="" docker-compose -f dockerfiles/docker-compose.yml up

MODE=$mode TOOL="" docker-compose -f dockerfiles/docker-compose.yml down -v
