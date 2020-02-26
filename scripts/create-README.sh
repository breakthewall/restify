#!/bin/bash

tool_name=$1


echo "# $tool_name-rest

REST version of $tool_name. It can run flask or redis mode. Source code may be found at the following location: [GitHub](https://github.com/brsynth/$tool_name-rest).

## Customize

The REST function has to be filled in the file [tofill/app/app.py](tofill/app/app.py).

## Run

\`\`\`
./run-in-docker.sh [flask|redis]
\`\`\`

## Link

The REST service is running in a separated network ($tool_name). To make the communication possible between the REST service and another container, please add the following option to the other container docker run command:

\`\`\`
docker run ... --net $tool_name ...
\`\`\`

Then, the REST service is reachable under \`$tool_name-rest\`.


## Test

A test environment can be set up. For that, please fill up two files:

+ [command.txt](tofill/test/command.txt)

 Modify the default command with propers arguments (one per line).

+ [RestQuery.py](tofill/test/RestQuery.py)

 Modify paramters according to the ones contained in \`command.txt\` file

### Prerequisites

* Docker - [Install](https://docs.docker.com/install/)

## Contributing

TODO

## Versioning

Version 1.0

## Authors

* ****

## References
[1]
Joan Hérisson (2020).
[restify tool](git@github.com:brsynth/restify.git)
University of Evry/Paris-Saclay.
Genomics Metabolics Laboratory, LiSSB, J.-L. Faulon's group.

## License
$tool_name-rest is released under the MIT licence.

" > README.md
