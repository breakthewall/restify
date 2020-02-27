#!/bin/bash

tool_url=$1
# basename=$(basename $tool_url)
# tool_name=${basename%.*}
tool_name=`echo $tool_url | awk -F'/' '{print $5;}'`

source scripts/functions

print "Build REST context"
bash ./scripts/get_release.sh https://github.com/brsynth/rest/archive/v1.0.0.tar.gz rest

print "Build tool context ($tool_name)"
bash ./scripts/get_release.sh $tool_url $tool_name


# Create .env file
./scripts/create-env.sh $tool_name
# Build image from Dockerfile file
docker build -f $tool_name/Dockerfile -t $tool_name . >/dev/null 2>&1
# Build image from docker-compose file
MODE="" DIR="$PWD" TOOL=$tool_name docker-compose -f dockerfiles/docker-compose.yml build >/dev/null 2>&1

# Create README.md
print "Create README.md"
./scripts/create-README.sh $tool_name

print "Ready to run! "
echo "     Please read README.md file for details."
echo ""
