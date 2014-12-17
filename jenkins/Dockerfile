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
# DESCRIPTION:    Jenkins v1.5x
# AUTHOR:         Patrick M. Slattery <pslattery@mywebgrocer.com>
# COMMENTS:
#   This file describes how to build a Jenkins CI container
#   Tested on CentOS v7
#   Based on: https://registry.hub.docker.com/_/jenkins/
# USAGE:
#   # Build image:
#   docker build --tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest https://raw.githubusercontent.com/Pipeliners/Dockerfiles/master/jenkins/1.594/Dockerfile
#   docker tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest registry.mywebgrocer.com/mywebgrocer/solr:1.594
#   docker tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest registry.mywebgrocer.com/mywebgrocer/solr:dev
#   docker login registry.mywebgrocer.com
#   docker push registry.mywebgrocer.com/mywebgrocer/jenkins
#   docker pull registry.mywebgrocer.com/mywebgrocer/jenkins
#
#   # Run the container:
#   docker run --detach --name jenkins --publish 8080:8080 registry.mywebgrocer.com/mywebgrocer/jenkins:latest
#
#   # Debug mode:
#   docker run --rm -it --name jenkins-debug --hostname jenkins-debug --publish 8080:8080 registry.mywebgrocer.com/mywebgrocer/jenkins:latest bash
#
#===============================================================================

# Pull base image.
FROM registry.mywebgrocer.com/mywebgrocer/java8_oracle:latest
MAINTAINER Patrick M. Slattery <pslattery@mywebgrocer.org>

ENV JENKINS_VERSION 1.594

RUN yum install -y zip
RUN mkdir /usr/share/jenkins/
RUN useradd -d /home/jenkins -m -s /bin/bash jenkins

COPY init.groovy /tmp/WEB-INF/init.groovy.d/tcp-slave-angent-port.groovy
RUN curl -L http://mirrors.jenkins-ci.org/war-stable/$JENKINS_VERSION/jenkins.war -o /usr/share/jenkins/jenkins.war && \
  cd /tmp && \
  zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy.d/tcp-slave-angent-port.groovy && \
  rm -rf /tmp/WEB-INF;

# Download and install Jenkins for RHEL/CentOS
# RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
# RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
# RUN yum install jenkins

ENV JENKINS_HOME /var/jenkins_home
RUN usermod -m -d "$JENKINS_HOME" jenkins && chown -R jenkins "$JENKINS_HOME"
VOLUME /var/jenkins_home

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

USER jenkins

COPY jenkins.sh /usr/local/bin/jenkins.sh
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
