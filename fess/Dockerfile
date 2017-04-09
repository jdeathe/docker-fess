FROM centos:7.3.1611

ARG FESS_VERSION="11.0.1"
ARG FESS_FILENAME="fess-${FESS_VERSION}.zip"
ARG FESS_RELEASE_URI="https://github.com/codelibs/fess/releases/download/fess-${FESS_VERSION}/${FESS_FILENAME}"
# ARG PHANTOMJS_VERSION="2.1.1"
# ARG PHANTOMJS_FILENAME="phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2"
# ARG PHANTOMJS_RELEASE_URI="https://bitbucket.org/ariya/phantomjs/downloads/${PHANTOMJS_FILENAME}"

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

# RUN rpm --rebuilddb \
# 	&& yum --setopt=tsflags=nodocs -y install \
# 		java-1.8.0-openjdk \
# 		unzip \
# 		bzip2 \
# 		fontconfig \
# 		freetype \
# 		freetype-devel \
# 		fontconfig-devel \
# 		libstdc++ \
# 		unoconv \
# 		libreoffice-headless \
# 		vlgothic-fonts \
# 		ImageMagick \
# 	&& curl -sOL ${FESS_RELEASE_URI} \
# 	&& unzip ${FESS_FILENAME} -d /opt \
# 	&& rm ${FESS_FILENAME} \
# 	&& ln -s /opt/fess-${FESS_VERSION} /opt/fess \
# 	&& curl -sOL ${PHANTOMJS_RELEASE_URI} \
# 	&& tar xvf ${PHANTOMJS_FILENAME} \
# 	&& cp phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin \
# 	&& rm -rf phantomjs-${PHANTOMJS_VERSION}-linux-x86_64 \
# 	&& yum clean all \
# 	&& rm -rf /etc/ld.so.cache \
# 	&& rm -rf /sbin/sln \
# 	&& rm -rf /usr/{{lib,share}/share/{man,doc,info,cracklib}} \
# 	&& rm -rf /{root,tmp,var/cache/{ldconfig,yum}}/*

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

# RUN useradd fess \
# 	&& chown fess:fess /opt/fess \
# 	&& chown -R fess:fess /opt/fess/*
# 
# USER fess

EXPOSE 8080 9201 9301

LABEL \
	maintainer="James Deathe <james.deathe@gmail.com>"

WORKDIR /opt/fess

ENTRYPOINT ["/opt/fess/bin/fess"]

CMD ["/opt/fess/bin/fess"]