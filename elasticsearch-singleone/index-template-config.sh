#!/bin/bash

set -eux
cd "$(dirname $0)"

# 创建一个索引模板 ( 6 分片，0 副本 )，匹配所有索引
# 因为是单节点，如果副本超过 0，index 状态会变为 yellow
curl -s -XPUT -H 'Content-Type:application/json' 'http://127.0.0.1:9200/_template/index-template' -d '
{
    "index_patterns": ["*"],
    "settings": {
        "number_of_shards": 6,
        "number_of_replicas": 0
    }
}'

# 创建一个测试索引并插入一条文档
curl -s -XPUT "http://127.0.0.1:9200/test-index/_doc/abc" -H 'Content-Type: application/json' -d'
{
    "a": 1,
    "b": 2,
    "c": 3
}'
