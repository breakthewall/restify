ARG DIR_NAME

FROM ${DIR_NAME}-rest:flask

# REDIS
RUN pip install rq
RUN apt-get update
RUN apt-get --quiet --yes install supervisor redis-server

CMD ["redis"]
