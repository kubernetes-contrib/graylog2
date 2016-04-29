FROM java:8-jre

RUN apt-get update && apt-get install -y pwgen

# https://packages.graylog2.org/releases/graylog2-server/graylog-1.3.4.tgz
ENV GL_VERSION=1.3.4
ENV GL_PACKAGE=graylog-${GL_VERSION}.tgz
ENV SOURCE_URL=https://packages.graylog2.org/releases/graylog2-server/${GL_PACKAGE}

RUN \
  cd /tmp && \
  wget $SOURCE_URL -O $GL_PACKAGE && \
  tar xvzf $GL_PACKAGE && \
  rm -f $GL_PACKAGE && \
  mv /tmp/graylog-${GL_VERSION} /graylog2

RUN mkdir -p /etc/graylog/server && \
    cp /graylog2/graylog.conf.example /etc/graylog/server/server.conf

COPY run_graylog2.sh /

CMD ["/run_graylog2.sh"]

EXPOSE 12900
EXPOSE 12201
EXPOSE 9300
