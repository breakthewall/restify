ARG TOOL_NAME

FROM brsynth/${TOOL_NAME}-rest

# FLASK
RUN pip install --upgrade pip
RUN pip install flask flask-restful

WORKDIR /REST

ENTRYPOINT ["python3", "/REST/Main.py"]
CMD ["flask"]

# Open server port
EXPOSE 8888
