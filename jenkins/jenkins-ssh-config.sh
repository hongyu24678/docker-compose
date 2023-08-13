#!/bin/bash

set -eux
cd "$(dirname $0)"

mkdir -p ./jenkins/jenkins_home/.ssh

tee -a ./jenkins/jenkins_home/.ssh/config <<'EOF'
Host *
    #Port 7181
    StrictHostKeyChecking no
    # 密钥权限需要为 600
    #IdentityFile ~/.ssh/jenkins.key
EOF

chmod 0700 ./jenkins/jenkins_home/.ssh
chown -R 1000:1000 ./jenkins/jenkins_home/.ssh
