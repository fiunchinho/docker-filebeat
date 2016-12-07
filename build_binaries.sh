#!/bin/sh

echo "Building filebeat..."

git clone https://github.com/elastic/beats.git
cd beats
docker run --rm -w="/go/src/github.com/elastic/beats/filebeat" -v "$PWD:/go/src/github.com/elastic/beats" -e "GOX_OS=linux" golang make crosscompile

mv ./filebeat/build/bin/filebeat-linux-386 ./../binary/filebeat
cd ..
rm -rf beats

echo "Done"