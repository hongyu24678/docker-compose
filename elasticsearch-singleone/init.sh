#!/bin/bash

set -eux
cd "$(dirname $0)"

BASE_DIR=./elasticsearch
DIR_ARRAY=( data logs plugins repo )
USER_ID=1000
GROUP_ID=1000

for dirName in "${DIR_ARRAY[@]}"; do
    # echo $dirName
    mkdir -p "$BASE_DIR/$dirName"
done

chown -R $USER_ID:$GROUP_ID $BASE_DIR

echo "Init: elasticsearch init success"
