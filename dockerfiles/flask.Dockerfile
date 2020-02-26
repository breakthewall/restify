ARG TOOL_NAME
ARG REST_MODE

FROM ${TOOL_NAME}

# FLASK
RUN pip install --upgrade pip
RUN pip install flask flask-restful

WORKDIR /REST

#ENTRYPOINT ["python3", "/REST/Main.py"]
#CMD ["flask"]
ENTRYPOINT python3 Main.py ${REST_MODE}

# Open server port
EXPOSE 8888
