# FESS: Open Source Enterprise Search Server 

[FESS](http://fess.codelibs.org/) is Full tExt Search System.

[HAProxy](http://www.haproxy.org/) is used as a, reverse proxy and to provide SSL/TLS termination.

Currently includes a custom, simplified, search UI however it might be removed and restricted to an API only front-end in the future.

## Prerequisites

To run this you will need `docker` and `docker-compose`.

By default, Docker host ports `80` and `443` are required by the reverse proxy container. If this is an issue, change the port mappings in the `docker-compose.yml` file before bringing the services up.

## Usage

Clone this repository and then run the following to start the project.

```
$ docker-compose up -d
```

> *Note:* It takes some time for the embedded elastic search service to start, dependent on system performance.

Tail the System log file. Proceed once you see a 'Boot successful' info message.

```
$ docker-compose exec fess tail -f logs/server_0.log
```

Point your browser at: `http://{docker-host}/`
