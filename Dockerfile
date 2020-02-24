ARG TOOL

FROM brsynth/${TOOL}-rest

RUN pip install rq

RUN apt-get update
RUN apt-get --quiet --yes install supervisor redis-server

WORKDIR /REST

#COPY src /REST/

ENTRYPOINT ["python3"]
CMD ["/REST/Main.py","flask"]

# Open server port
EXPOSE 8888
