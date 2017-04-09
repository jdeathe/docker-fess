# FESS: Open Source Enterprise Search Server 

[FESS](http://fess.codelibs.org/) is Full tExt Search System.

[Caddy](https://caddyserver.com/) is used as a simple, reverse proxy and to provide SSL/TLS termination. This might be replaced with an HAProxy solution.

Currently includes a custom, simplified, search UI however it might be removed and restricted to an API only front-end in the future.

## Prerequisites

To run this you will need `docker` and `docker-compose`.

By default, Docker host ports `80` and `443` are required by the reverse proxy container. If this is an issue, change the port mappings in the `docker-compose.yml` file before bringing the services up.

## Usage

Clone this repository and then run the following to start the project named `fess`.

```
$ docker-compose -p fess up -d
```

*Note:* It takes some time for the embedded elastic search service to start, dependent on system performance.

Point your browser at: `http://{docker-host}/`
