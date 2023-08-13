```shell
tee -a /etc/sysctl.conf <<'EOF'
vm.overcommit_memory = 1
EOF

sysctl -p
```