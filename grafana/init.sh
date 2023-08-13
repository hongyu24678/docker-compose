#!/bin/bash

set -eux

cd "$(dirname "$0")"

mkdir -p grafana
chown -R 472:0 grafana

echo "Init Success !"
