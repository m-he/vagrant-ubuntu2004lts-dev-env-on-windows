#!/bin/sh
echo 'Setting static IP address for Hyper-V...'

cat << EOF > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses: [172.16.0.2/24]
      gateway4: 172.16.0.1
      nameservers:
        addresses: [1.1.1.1,1.0.0.1]
EOF

rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf