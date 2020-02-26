#!/bin/bash

tool_url=$1
basename=$(basename $tool_url)
tool_name=${basename%.*}

# Clone REST part
git submodule add https://github.com/brsynth/rest.git
#git clone https://github.com/brsynth/rest.git
# Clone tool part
git submodule add $tool_url
#git clone $tool_url
# # Clone tool REST part
# tool_rest_url=`echo $tool_url | sed 's|\(.*\)/.*|\1|'`
# git clone $tool_rest_url"/"$tool_name"-rest.git"

# Rename the current folder
#mv "$PWD" "${PWD%/*}/${tool_name}-rest"


./scripts/create-env.sh $tool_name

./scripts/create-README.sh $tool_name
