#!/bin/sh

VERSION=${VERSION:=v1.3.1}

echo "Building filebeat..."

git clone https://github.com/elastic/beats.git
cd beats
git checkout tags/${VERSION}
docker run --rm -w="/go/src/github.com/elastic/beats/filebeat" -v "$PWD:/go/src/github.com/elastic/beats" -e "GOX_OS=linux" golang make crosscompile

mv ./filebeat/build/bin/filebeat-linux-386 ./../binary/filebeat
cd ..
rm -rf beats

echo "Done"