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
#   docker build --tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest /home/patrickmslattery/source/git/Pipeliners/Dockerfiles/jenkins/
#   docker tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest registry.mywebgrocer.com/mywebgrocer/jenkins:1.594
#   docker tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest registry.mywebgrocer.com/mywebgrocer/jenkins:dev
#   docker login registry.mywebgrocer.com
#   docker push registry.mywebgrocer.com/mywebgrocer/jenkins
#   docker pull registry.mywebgrocer.com/mywebgrocer/jenkins
#
#   # Run the container:
#   docker run --detach --name jenkins --hostname jenkins --publish 8080:8080 --publish 50000:50000 registry.mywebgrocer.com/mywebgrocer/jenkins:latest
#   docker logs jenkins
#
#   # Debug mode:
#   docker run --rm -it --name jenkins-debug --hostname jenkins-debug --publish 8080:8080 --publish 50000:50000 registry.mywebgrocer.com/mywebgrocer/jenkins:latest bash
#
#===============================================================================

# Pull base image.
FROM registry.mywebgrocer.com/mywebgrocer/java8_oracle:latest
MAINTAINER Patrick M. Slattery <pslattery@mywebgrocer.org>

ENV JENKINS_VERSION 1.594

# Download and install Jenkins for RHEL/CentOS
RUN curl --location http://pkg.jenkins-ci.org/redhat/jenkins.repo --output /etc/yum.repos.d/jenkins.repo -#
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install -y jenkins-${JENKINS_VERSION}

# ENV JENKINS_HOME /var/jenkins_home
# RUN usermod -m -d "$JENKINS_HOME" jenkins && chown -R jenkins "$JENKINS_HOME"
# VOLUME /var/jenkins_home

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

USER jenkins

CMD ["/opt/java/latest/bin/java", "-jar", "/usr/lib/jenkins/jenkins.war"]
