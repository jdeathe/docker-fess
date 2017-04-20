FROM centos:7.3.1611

ARG FESS_VERSION="11.0.3"
ARG FESS_FILENAME="fess-${FESS_VERSION}.zip"
ARG FESS_RELEASE_URI="https://github.com/codelibs/fess/releases/download/fess-${FESS_VERSION}/${FESS_FILENAME}"

RUN rpm --rebuilddb \
	&& yum --setopt=tsflags=nodocs -y install \
		java-1.8.0-openjdk-headless \
		unzip \
	&& curl -sOL ${FESS_RELEASE_URI} \
	&& unzip ${FESS_FILENAME} -d /opt \
	&& rm ${FESS_FILENAME} \
	&& ln -s /opt/fess-${FESS_VERSION} /opt/fess \
	&& yum clean all \
	&& rm -rf /etc/ld.so.cache \
	&& rm -rf /sbin/sln \
	&& rm -rf /usr/{{lib,share}/share/{man,doc,info,cracklib}} \
	&& rm -rf /{root,tmp,var/cache/{ldconfig,yum}}/*

COPY src/app /opt/fess/app/
COPY src/app/WEB-INF/view /opt/fess/app/WEB-INF/orig/view/

RUN sed -i \
		-e 's~\(defaultMaxLength">\)[0-9]*\(<\)~\1157286400\2~' \
		/opt/fess/app/WEB-INF/classes/crawler/contentlength.xml \
	&& { \
		echo 'api.access.token.required=true'; \
		echo 'thumbnail.enabled=false'; \
		echo 'web.api.gsa=true'; \
		echo 'web.api.json=true'; \
	} >> /opt/fess/app/WEB-INF/conf/system.properties

EXPOSE 8080 9201 9301

LABEL \
	maintainer="James Deathe <james.deathe@gmail.com>"

WORKDIR /opt/fess

ENTRYPOINT ["/opt/fess/bin/fess"]

CMD ["/opt/fess/bin/fess"]