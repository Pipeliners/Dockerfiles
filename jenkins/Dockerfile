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
# RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/junit.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/antisamy-markup-formatter.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/translation.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/ldap.hpi

# Replace any outdated Jenkins plugins:
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/maven-plugin.hpi
# RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/subversion.hpi
RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/mailer.hpi
# RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/matrix-auth.hpi
# RUN zip -d /opt/jenkins/jenkins.war WEB-INF/plugins/matrix-project.hpi

# Still need to update the following plugins
# Subversion Plugin - This plugin adds the Subversion support (via SVNKit) to Jenkins.
# 2.4.5	1.54
#
# Matrix Project Plugin - Multi-configuration (matrix) project type.
# 1.4	1.3
# 	
# Matrix Authorization Strategy Plugin - Offers matrix-based security authorization strategies (global and per-project).
# 1.2	1.1
# 	
# JUnit Plugin - Allows JUnit-format test results to be published.
# 1.3	1.2-beta-4
#	
# Javadoc Plugin - This plugin adds Javadoc support to Jenkins.
# 1.3	1.1
#	
# Credentials Plugin - This plugin allows you to store credentials in Jenkins.
# 1.19	1.18

RUN mkdir -p /var/lib/jenkins/plugins
# Plugins to replace:
RUN curl --location http://updates.jenkins-ci.org/latest/maven-plugin.hpi --output /var/lib/jenkins/plugins/maven-plugin.hpi -#
# RUN curl --location http://updates.jenkins-ci.org/latest/subversion.hpi --output /var/lib/jenkins/plugins/subversion.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/mailer.hpi --output /var/lib/jenkins/plugins/mailer.hpi -#
# RUN curl --location http://updates.jenkins-ci.org/latest/matrix-auth.hpi --output /var/lib/jenkins/plugins/matrix-auth.hpi -#
# RUN curl --location http://updates.jenkins-ci.org/latest/matrix-project.hpi --output /var/lib/jenkins/plugins/matrix-project.hpi -#
# New plugins:
RUN curl --location http://updates.jenkins-ci.org/latest/sidebar-link.hpi --output /var/lib/jenkins/plugins/sidebar-link.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/greenballs.hpi --output /var/lib/jenkins/plugins/greenballs.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/postbuild-task.hpi --output /var/lib/jenkins/plugins/postbuild-task.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/copy-to-slave.hpi --output /var/lib/jenkins/plugins/copy-to-slave.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/git-client.hpi --output /var/lib/jenkins/plugins/git-client.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/active-directory.hpi --output /var/lib/jenkins/plugins/active-directory.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/jira.hpi --output /var/lib/jenkins/plugins/jira.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/build-pipeline-plugin.hpi --output /var/lib/jenkins/plugins/build-pipeline-plugin.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi --output /var/lib/jenkins/plugins/parameterized-trigger.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/jquery.hpi --output /var/lib/jenkins/plugins/jquery.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/dashboard-view.hpi --output /var/lib/jenkins/plugins/dashboard-view.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/docker-build-publish.hpi --output /var/lib/jenkins/plugins/docker-build-publish.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/token-macro.hpi --output /var/lib/jenkins/plugins/token-macro.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/beer.hpi --output /var/lib/jenkins/plugins/beer.hpi -#
# Add Docker plugin - Use a docker host to dynamically provision a slave, run a single build, then tear-down that slave.
RUN curl --location http://updates.jenkins-ci.org/latest/docker-plugin.hpi --output /var/lib/jenkins/plugins/docker-plugin.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/durable-task.hpi --output /var/lib/jenkins/plugins/durable-task.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/docker-plugin.hpi --output /var/lib/jenkins/plugins/docker-plugin.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/ssh-slaves.hpi --output /var/lib/jenkins/plugins/ssh-slaves.hpi -#
RUN curl --location http://updates.jenkins-ci.org/latest/chucknorris.hpi --output /var/lib/jenkins/plugins/chucknorris.hpi -#

ENV JENKINS_HOME /var/lib/jenkins
# RUN usermod -m -d "$JENKINS_HOME" jenkins && chown -R jenkins "$JENKINS_HOME"
# VOLUME /var/jenkins_home

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

# USER jenkins

CMD ["/opt/java/latest/bin/java", "-jar", "/opt/jenkins/jenkins.war"]
