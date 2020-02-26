#!/bin/bash

mode=$1

MODE=$mode DIR=$PWD docker-compose up --build rest

MODE=$mode DIR=$PWD docker-compose down -v
