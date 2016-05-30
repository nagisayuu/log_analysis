# Dockerfile for Apache HTTP Server

FROM centos:centos6
MAINTAINER Yuuhe Nagisa

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
ADD elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
RUN yum -y install elasticsearch
RUN yum -y install java-1.8.0-openjdk
RUN yum -y install initscripts
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]
