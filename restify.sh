#!/bin/bash

tool_url=$1
basename=$(basename $tool_url)
tool_name=${basename%.*}

branch=$2
if [ "$branch" == "" ]; then
    branch="master"
fi

source scripts/functions

# Clone REST part
print "Clone REST part"
git submodule add https://github.com/brsynth/rest.git
# Clone tool part
print "Clone tool part ($tool_name)"
git submodule add $tool_url
print "Put in the right branch ($branch)"
git --git-dir=./rest/.git checkout $branch

# Create .env files
print "Create .env files"
./scripts/create-env.sh $tool_name


# Build images instanciated in the docker-compose file
print "Build tool image ($tool_name)"
docker build -f $tool_name/Dockerfile -t $tool_name .
print "Build REST images"
MODE=flask TOOL=$tool_name docker-compose -f dockerfiles/docker-compose.yml build
MODE=redis TOOL=$tool_name docker-compose -f dockerfiles/docker-compose.yml build

# Create README.md
print "Create README.md"
./scripts/create-README.sh $tool_name
