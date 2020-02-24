#!/bin/bash


# Clone REST part
git clone https://github.com/brsynth/rest.git

# Clone tool part
tool_url=$1
basename=$(basename $tool_url)
tool_name=${basename%.*}
git clone $tool_url

# Rename the current folder
mv "$PWD" "${PWD%/*}/${tool_name}-rest"

echo "
TOOL_TAG=master
MODE=redis
IMAGE_TAG=redis
COMMAND=\"python3 ../tofill/test/RestQuery.py -file_1 input/<filename> -param_1 <param_1>\"
TOOL="$tool_name > .env
