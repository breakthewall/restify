ARG TOOL_NAME

FROM brsynth/${TOOL_NAME}-rest

# FLASK
RUN pip install --upgrade pip
RUN pip install flask flask-restful

# REDIS
RUN pip install rq
RUN apt-get update
RUN apt-get --quiet --yes install supervisor redis-server

WORKDIR /REST

#COPY src /REST/

ENTRYPOINT ["python3"]
CMD ["/REST/Main.py","flask"]

# Open server port
EXPOSE 8888
