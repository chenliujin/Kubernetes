#!/bin/bash

docker run \
	-it \
	--rm \
	-v /usr/share/java:/usr/share/java \
	-v /opt/logstash/conf:/opt/logstash/conf \
	logstash:5.4.2 \
	logstash -f /opt/logstash/conf/weixin_cp_order_new.conf
