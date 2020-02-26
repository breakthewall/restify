#!/bin/bash

tool_url=$1
basename=$(basename $tool_url)
tool_name=${basename%.*}

branch=$2
if [ "$branch" == "" ]; then
    branch="master"
fi

# Clone REST part
git submodule add https://github.com/brsynth/rest.git
# Clone tool part
git submodule add $tool_url
git --git-dir=./rest/.git checkout $branch

# Create .env files
./scripts/create-env.sh $tool_name


# Build images instanciated in the docker-compose file
DIR=$PWD docker-compose -f dockerfiles/docker-compose.yml build

# Create README.md
./scripts/create-README.sh $tool_name
