#!/bin/bash

/etc/init.d/elasticsearch start
/etc/init.d/kibana start
exec /bin/bash
