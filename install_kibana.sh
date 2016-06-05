#!/bin/bash

PREFIX=/opt

groupadd kibana
useradd kibana -g kibana
mkdir -m777 -p $PREFIX
su - kibana
cd $PREFIX
curl https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz
tar xvzf kibana-4.5.1-linux-x64.tar.gz
ln -s $PREFIX/kibana-4.5.1-linux-x64 kibana

