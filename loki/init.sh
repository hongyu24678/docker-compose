#!/bin/bash

set -eux
cd "$(dirname $0)"

mkdir -p ./loki

chown -R 10001:10001 ./loki
