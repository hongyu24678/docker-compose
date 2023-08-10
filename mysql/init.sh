#!/bin/bash

set -ue

cd "$(dirname ${0})"

mkdir -p ./mysql/{data,binlog,slowlog,run}

chown -R 999:999 ./mysql

echo 'Mysql: Init Success !'
