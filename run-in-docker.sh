#!/bin/bash

#mode=$1
mode=redis

MODE=$mode TOOL=$TOOL docker-compose up rest

MODE=$mode TOOL=$TOOL docker-compose down -v
