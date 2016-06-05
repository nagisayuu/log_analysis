# Dockerfile for Apache HTTP Server

FROM centos:centos6
MAINTAINER Yuuhe Nagisa

### installing elasticsearch ###
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
ADD elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
RUN yum -y install elasticsearch
RUN yum -y install java-1.8.0-openjdk
RUN yum -y install initscripts
RUN yum -y install sudo
RUN yum -y install curl
### ### ###
### installing kibana ###
# ADD elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
ADD kibana.repo /etc/yum.repos.d/kibana.repo
RUN yum -y install kibana
### ### ###
### installing fluentd(td-agent) ###
RUN curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
### ### ###
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]
