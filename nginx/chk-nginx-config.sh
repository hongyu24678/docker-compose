#!/bin/bash

set -eux
cd "$(dirname $0)"

docker-compose exec nginx nginx -t
