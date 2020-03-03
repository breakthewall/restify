#!/bin/bash

tool_url=$1
basename=$(basename $tool_url)
tool_name=${basename%.*}

branch=$2
if [ "$branch" == "" ]; then
    branch="stable"
fi

source scripts/functions

print "Build REST context"
# Add submodule
git submodule add https://github.com/brsynth/rest.git >/dev/null 2>&1

print "Build tool context ($tool_name)"
# Add submodule
git submodule add $tool_url >/dev/null 2>&1
# Put in the right branch
git --git-dir=./rest/.git checkout $branch >/dev/null 2>&1
# Create .env file
./scripts/create-env.sh $tool_name
# Build image from Dockerfile file
docker build -f $tool_name/Dockerfile -t $tool_name . >/dev/null 2>&1
# Build images from docker-compose file
MODE="flask" DIR="$PWD" docker-compose -f dockerfiles/docker-compose.yml build >/dev/null 2>&1
MODE="redis" DIR="$PWD" docker-compose -f dockerfiles/docker-compose.yml build >/dev/null 2>&1


# Create README.md
print "Create README.md"
./scripts/create-README.sh $tool_name

print "Ready to run! "
echo "     Please read README.md file for details."
echo ""

rm ./restify.sh
