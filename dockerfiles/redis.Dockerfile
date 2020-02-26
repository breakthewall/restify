ARG TOOL

FROM ${TOOL}-rest:flask

# REDIS
RUN pip install rq
RUN apt-get update
RUN apt-get --quiet --yes install supervisor redis-server

CMD ["redis"]
