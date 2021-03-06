#===============================================================================
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
# VERSION:        0.1
# DESCRIPTION:    Solr v4.x.x
# AUTHOR:         Patrick M. Slattery <pslattery@mywebgrocer.com>
# COMMENTS:
#   This file describes how to build an Apache Solr container
#   Tested on CentOS v7
#   Based on: ----
# USAGE:
#   # Build image:
#   docker build --tag registry.mywebgrocer.com/mywebgrocer/solr:latest https://raw.githubusercontent.com/Pipeliners/Dockerfiles/master/solr/4.10.2/Dockerfile
#   docker tag registry.mywebgrocer.com/mywebgrocer/solr:latest registry.mywebgrocer.com/mywebgrocer/solr:4.10.2
#   docker tag registry.mywebgrocer.com/mywebgrocer/solr:latest registry.mywebgrocer.com/mywebgrocer/solr:dev
#   docker login registry.mywebgrocer.com
#   docker push registry.mywebgrocer.com/mywebgrocer/solr
#   docker pull registry.mywebgrocer.com/mywebgrocer/solr
#
#   # Run the container:
#   docker run --detach --name solr --publish 8983:8983 registry.mywebgrocer.com/mywebgrocer/solr:latest
#
#   # Debug mode:
#   docker run --rm -it --name solr-debug --hostname solr-debug --publish 8983:8983 registry.mywebgrocer.com/mywebgrocer/solr:latest bash
#
#===============================================================================

# Pull base image.
FROM registry.mywebgrocer.com/mywebgrocer/java8_oracle:latest
MAINTAINER Patrick M. Slattery <pslattery@mywebgrocer.org>

ENV SOLR_VERSION 4.10.2
ENV CONNECTORJ_VERSION 5.1.34

# Download and install the MySQL Java connector
RUN curl -k --location http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${CONNECTORJ_VERSION}.tar.gz -o /tmp/mysql-connector-java-${CONNECTORJ_VERSION}.tar.gz -#
  # tar xfz /tmp/mysql-connector-java-${CONNECTORJ_VERSION}.tar.gz mysql-connector-java-${CONNECTORJ_VERSION}/mysql-connector-java-${CONNECTORJ_VERSION}-bin.jar -O > ${FISHEYE_LIBRARY_PATH}/mysql-connector-java-${CONNECTORJ_VERSION}-bin.jar && \
  # chown -cR ufecru:gfecru ${FISHEYE_LIBRARY_PATH};
RUN mkdir -p /opt/solr
RUN curl -sSL http://apache.mirrors.pair.com/lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.tgz | tar -v -C /opt -xz
RUN cp -r /opt/solr-$SOLR_VERSION/example /opt/solr
WORKDIR /opt/solr/example
VOLUME /opt/solr/solr/core1/data
EXPOSE 8983
CMD ["/opt/java/latest/bin/java", "-jar", "start.jar"]
