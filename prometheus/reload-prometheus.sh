#!/bin/bash

set -eux
cd "$(dirname $0)"

curl -i -XPOST -u "admin:X2j6bCS0t33Lo78" http://127.0.0.1:9090/-/reload
