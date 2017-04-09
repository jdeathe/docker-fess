FROM jdeathe/caddy:1.0.0

USER root

COPY src/etc/caddy/Caddyfile \
	/etc/caddy/

USER 497

CMD ["-conf", "/etc/caddy/Caddyfile", "-quiet=true"]
