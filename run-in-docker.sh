#!/bin/bash

#mode=$1
mode=redis

MODE=$mode docker-compose up rest

MODE=$mode docker-compose down -v
