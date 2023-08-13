#!/bin/bash

set -eu

cd "$(dirname "$0")"

mkdir -p ./alertmanager
chown -R 65534:65534 ./alertmanager

echo "Alertmanager: Init Success !"
