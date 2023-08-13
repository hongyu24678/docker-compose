#!/bin/bash

set -eu
cd "$(dirname $0)"

mkdir -p ./jenkins/{jenkins_home,maven_localrepo}
chown -R 1000:1000 ./jenkins

echo "Init Success !"
