#!/bin/bash

# Render config file
cat filebeat.yml | sed "s/LOGSTASH_HOST/$LOGSTASH_HOST/g" | sed "s/LOGSTASH_PORT/$LOGSTASH_PORT/g" > filebeat.yml.temp
cat filebeat.yml.temp > filebeat.yml
rm filebeat.yml.temp