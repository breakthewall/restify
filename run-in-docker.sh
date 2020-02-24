#!/bin/bash

#mode=$1
mode=redis

source .env

MODE=$mode TOOL=$TOOL docker-compose up --build rest

MODE=$mode TOOL=$TOOL docker-compose down -v
