## 配置内存分配策略

```shell
tee -a /etc/sysctl.conf <<-'EOF'
# 内存分配策略 ( redis )
vm.overcommit_memory = 1
EOF

sysctl -p
```
