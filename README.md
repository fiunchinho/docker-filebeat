# Docker Filebeat image
This image contains filebeat so you can send logs from a server to Logstash or Elasticsearch.
The default configuration will send logs to a specific Logstash instance, so it's expecting some environment variables to know where is the Logstash instance.

## Loading the Index Template in Elasticsearch
Before saving logs in ElasticSearch you need to save the filebeat template that you can find in this repo
```
curl -XPUT 'http://elasticsearch_host:9200/_template/filebeat?pretty' -d@binary/filebeat.template.json
```


## Running
To start the container run
```
docker run -e "LOGSTASH_HOST=logstash.tld" -e "LOGSTASH_PORT=5001" -e "INDEX=logstash" fiunchinho/docker-filebeat
```

If you want Filebeat to read from stdin, make the container interactive
```
docker run -i -e "LOGSTASH_HOST=logstash.tld" -e "LOGSTASH_PORT=5001" -e "INDEX=logstash" fiunchinho/docker-filebeat
```

This image contains a sample configuration file that expects logs coming from stdin, but you can load your own configuration file by mounting the config file from your docker host:
```
docker run -v "/path/to/your/filebeat.yml:/filebeat.yml" "-e "LOGSTASH_HOST=logstash.tld" -e "LOGSTASH_PORT=5001" -e "INDEX=logstash" fiunchinho/docker-filebeat
```
