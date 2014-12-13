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
# DESCRIPTION:    CentOS 7 update 
# AUTHOR:         Patrick M. Slattery <pslattery@mywebgrocer.com>
# COMMENTS:
#   This file describes how to build an updated CentOS 7 container which contains some necessary base tools and the latest patches
#   Tested on CentOS v7
#   Based on: https://github.com/dockerfile/java/blob/master/centos7_u2d/Dockerfile
# USAGE:
#   # Build image:
#   docker build --tag registry.mywebgrocer.com/mywebgrocer/centos7_u2d:latest https://raw.githubusercontent.com/patrickmslatteryvt/dockerfiles/master/centos7_u2d/Dockerfile
#   docker tag registry.mywebgrocer.com/mywebgrocer/centos7_u2d:latest registry.mywebgrocer.com/mywebgrocer/centos7_u2d:dec_12_2014
#   docker tag registry.mywebgrocer.com/mywebgrocer/centos7_u2d:latest registry.mywebgrocer.com/mywebgrocer/centos7_u2d:dev
#
#   # Run the container:
#   docker run --rm --name centos7_u2d registry.mywebgrocer.com/mywebgrocer/centos7_u2d:latest cat /etc/redhat-release
#
#   # Debug mode:
#   docker run --rm -it registry.mywebgrocer.com/mywebgrocer/centos7_u2d:latest bash
#
#===============================================================================

# Pull base image.
FROM centos:centos7
MAINTAINER Patrick M. Slattery <pslattery@mywebgrocer.org>

RUN yum update -y && yum install -y nano tar unzip lsof && yum clean all
# Download and install jq
RUN curl -k --location http://stedolan.github.io/jq/download/linux64/jq -o /usr/local/bin/jq -# && chmod -c +x /usr/local/bin/jq
