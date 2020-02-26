#!/bin/sh

# 'flask' or 'redis'
mode=$1

../rest/run.sh $mode &

sleep 5

source ../.env

pip install --upgrade pip
pip install requests
python3 RestQuery.py `tr -d '\n' < ../tofill/test/args.txt` -server_url http://${TOOL_REST}_${mode}:8888/REST
