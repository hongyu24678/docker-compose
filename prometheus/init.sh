#!/bin/bash

set -eu

cd "$(dirname "$0")"

mkdir -p ./prometheus-data
chown -R 65534:65534 ./prometheus-data

echo "Prometheus: Init Success !"
