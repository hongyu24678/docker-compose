一般情况下启动容器后会自动配置 iptables 进行数据包伪装，如果没有成功执行可以手动进行 ip 数据包伪装使客户端可以通过 openvpn 连接 vpn 内网其他主机

-s CIDR 指定数据包的源地址来源于指定网段的数据包才进行 ip 伪装

```shell
# 指定 -o 接口名 表示客户端的数据包经过伪装后只能从 openvpn 主机的指定接口流出 ( 这个接口一般是 vpn 推送给客户端内网网段所在的接口 )
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o ens36 -j MASQUERADE

# 不指定 -o 表示客户端的数据包经过伪装后可以流向所有接口 ( 一般推送默认网关时使用 )
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j MASQUERADE

# 添加 -d CIDR 表示只有目标地址是指定网段的数据包才进行 ip 伪装
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -d 172.27.17.0/24 -o ens36 -j MASQUERADE
```

检查规则

```shell
:~# iptables -t nat -L POSTROUTING -nv --line-number
Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 MASQUERADE  all  --  *      !docker0  172.17.0.0/16        0.0.0.0/0           
2        7   420 MASQUERADE  all  --  *      *       10.8.0.0/24          0.0.0.0/0  ## 此处的 out 为 * 是因为设置规则时没有指定 -o 选项
```

