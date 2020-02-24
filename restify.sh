#!/bin/bash

tool_url=$1
basename=$(basename $tool_url)
tool_name=${basename%.*}

# Clone REST part
git clone https://github.com/brsynth/rest.git
# Clone tool part
git clone $tool_url
# Clone tool REST part
tool_rest_url=`echo $tool_url | sed 's|\(.*\)/.*|\1|'`
git clone $tool_rest_url"/"$tool_name"-rest.git"

# Rename the current folder
#mv "$PWD" "${PWD%/*}/${tool_name}-rest"

echo "
TOOL_TAG=master
MODE=redis
IMAGE_TAG=redis
COMMAND=\"python3 ../${tool_name}-rest/test/RestQuery.py -file_1 input/<filename> -param_1 <param_1>\"
TOOL="$tool_name > .env

#./build-docker-image.sh redis

echo "# $tool_name-rest

REST version of $tool_name. It can run flask or redis mode. Source code may be found at the following location: [GitHub](https://github.com/brsynth/restify).

## Build image

Compile the docker using the Dockerfile using the following command:

\`\`\`
docker build --build-arg mode=[flask|redis] -t brsynth/$tool_name-rest:[flask|redis] -f Dockerfile
\`\`\`

## Run

\`\`\`
MODE=[flask|redis] docker-compose up rest
\`\`\`

Then, to clean docker objects:
\`\`\`
MODE=[flask|redis] docker-compose down -v
\`\`\`
" > README.md
