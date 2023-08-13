#!/bin/bash

set -eux
cd "$(dirname $0)"

chown -R 999:999 redis sentinel

echo "Init: redis-sentinel init success"
