ARG TOOL_NAME
ARG REST_MODE

FROM ${TOOL_NAME}-rest:flask

# REDIS
RUN pip install rq
RUN apt-get update
RUN apt-get --quiet --yes install supervisor redis-server

ENTRYPOINT python3 Main.py ${REST_MODE}
