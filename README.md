# rp2paths-rest

REST version of rp2paths. It can run flask or redis mode. Source code may be found at the following location: [GitHub](https://github.com/brsynth/restify).

## Build image

Compile the docker using the Dockerfile using the following command:

```
docker build --build-arg mode=[flask|redis] -t brsynth/rp2paths-rest:[flask|redis] -f dockerfile
```

# <tool>-rest

REST version of <tool>. It can run flask or redis mode. Source code may be found at the following location: [GitHub](https://github.com/brsynth/restify).

## Build image

Compile the docker using the Dockerfile using the following command:

```
docker build --build-arg mode=[flask|redis] -t brsynth/<tool>-rest:[flask|redis] -f dockerfile
```


## Run

```
MODE=[flask|redis] docker-compose up rest
```

Then, to clean docker objects:
```
MODE=[flask|redis] docker-compose down -v
```

### Prerequisites

* Docker - [Install](https://docs.docker.com/v17.09/engine/installation/)

## Contributing

TODO

## Versioning

Version 0.1

## Authors

* **Melchior du Lac**
* Joan Hérisson

## License

[MIT](https://github.com/brsynth/rp2paths/blob/master/LICENSE.txt)
# restify
