#!/bin/sh

# 'flask' or 'redis'
mode=$1

../rest/run.sh $mode &

sleep 5

source ../.env

pip install --upgrade pip
pip install requests
python3 ../${TOOL}-rest/test/RestQuery.py -file_1 <filename> -param_1 <param_1> -server_url http://${TOOL_REST}_${mode}:8888/REST
