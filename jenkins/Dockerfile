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
#   docker build --tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest https://raw.githubusercontent.com/Pipeliners/Dockerfiles/master/jenkins/Dockerfile
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

# Download and install Jenkins
RUN mkdir -p /opt/jenkins
RUN curl --location http://mirrors.jenkins-ci.org/war/${JENKINS_VERSION}/jenkins.war --output /opt/jenkins/jenkins.war -#

# Remove any unnecessary or unused Jenkins plugins:
RUN yum install -y zip
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/cvs.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/pam-auth.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/javadoc.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/junit.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/antisamy-markup-formatter.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/translation.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/ldap.hpi

# Replace any outdated Jenkins plugins:
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/maven-plugin.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/subversion.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/mailer.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/matrix-auth.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/matrix-project.hpi

RUN \
  mkdir -p /var/lib/jenkins/plugins && \
  cd /var/lib/jenkins/plugins && \
  # Plugins to replace: && \
  curl --location http://updates.jenkins-ci.org/latest/javadoc.hpi --output maven-plugin.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/subversion.hpi --output subversion.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/ldap.hpi --output ldap.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/mailer.hpi --output mailer.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/matrix-auth.hpi --output matrix-auth.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/matrix-project.hpi --output matrix-project.hpi -# && \
  # New plugins: && \
  curl --location http://updates.jenkins-ci.org/latest/sidebar-link.hpi --output sidebar-link.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/greenballs.hpi --output greenballs.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/postbuild-task.hpi --output postbuild-task.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/copy-to-slave.hpi --output copy-to-slave.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/git-client.hpi --output git-client.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/active-directory.hpi --output active-directory.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/jira.hpi --output jira.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/build-pipeline-plugin.hpi --output build-pipeline-plugin.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi --output parameterized-trigger.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/jquery.hpi --output jquery.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/dashboard-view.hpi --output dashboard-view.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/docker-build-publish.hpi --output docker-build-publish.hpi -# && \
  curl --location http://updates.jenkins-ci.org/latest/token-macro.hpi --output token-macro.hpi -#;
  
ENV JENKINS_HOME /var/lib/jenkins
# RUN usermod -m -d "$JENKINS_HOME" jenkins && chown -R jenkins "$JENKINS_HOME"
# VOLUME /var/jenkins_home

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

# USER jenkins

CMD ["/opt/java/latest/bin/java", "-jar", "/opt/jenkins/jenkins.war"]
