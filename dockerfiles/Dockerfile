ARG TOOL_NAME
ARG REST_MODE

FROM ${TOOL_NAME}

# FLASK
RUN pip install --upgrade pip
RUN pip install flask flask-restful

# REDIS
RUN pip install rq
RUN apt-get update
RUN apt-get --quiet --yes install supervisor redis-server

WORKDIR /REST

#ENTRYPOINT ["python3", "/REST/Main.py"]
#CMD ["flask"]
ENTRYPOINT python3 Main.py ${REST_MODE}

# Open server port
EXPOSE 8888
