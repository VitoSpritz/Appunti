#!/bin/bash
#sudo ip -all netns delete
#sudo ip l del LAN1
#sudo ip l del LAN2
#sudo ip l del LAN3

sudo ip net add H1_1
sudo ip net add H1_2
sudo ip net add H2_1
sudo ip net add H2_2
sudo ip net add H3_1
sudo ip net add GTW1
sudo ip net add GTW2

sudo ip l add eth1_1 type veth peer veth1_1
sudo ip l add eth1_2 type veth peer veth1_2
sudo ip l add eth2_1 type veth peer veth2_1
sudo ip l add eth2_2 type veth peer veth2_2
sudo ip l add eth3_1 type veth peer veth3_1

#da router 1 a LAN 1 e LAN 2

sudo ip l add eth_gtw_1 type veth peer veth_gtw_1
sudo ip l add eth_gtw_2 type veth peer veth_gtw_2

#da router 2 a LAN 3

sudo ip l add eth_gtw_3 type veth peer veth_gtw_3

#da router 1 a router 2

sudo ip l add eth_GTW type veth peer veth_GTW

sudo ip l add LAN1 type bridge
sudo ip l add LAN2 type bridge
sudo ip l add LAN3 type bridge

sudo ip l set LAN1 up
sudo ip l set LAN2 up
sudo ip l set LAN3 up

sudo ip l set veth1_1 netns H1_1
sudo ip l set veth1_2 netns H1_2
sudo ip l set veth2_1 netns H2_1
sudo ip l set veth2_2 netns H2_2
sudo ip l set veth3_1 netns H3_1
sudo ip l set veth_gtw_1 netns GTW1
sudo ip l set veth_gtw_2 netns GTW1
sudo ip l set veth_gtw_3 netns GTW2

sudo ip l set eth1_1 master LAN1
sudo ip l set eth1_2 master LAN1
sudo ip l set eth2_1 master LAN2
sudo ip l set eth2_2 master LAN2
sudo ip l set eth3_1 master LAN3
sudo ip l set eth_gtw_1 master LAN1
sudo ip l set eth_gtw_2 master LAN2

sudo ip l set eth_gtw_3  master LAN3

sudo ip l set veth_GTW netns GTW1
sudo ip l set eth_GTW netns GTW2

sudo ip net exec H1_1 ip addr add 192.168.1.1/24 dev veth1_1
sudo ip net exec H1_2 ip addr add 192.168.1.2/24 dev veth1_2
sudo ip net exec H2_1 ip addr add 192.168.2.1/24 dev veth2_1
sudo ip net exec H2_2 ip addr add 192.168.2.2/24 dev veth2_2

sudo ip l set eth1_1 up
sudo ip l set eth1_2 up
sudo ip l set eth2_1 up
sudo ip l set eth2_2 up
sudo ip l set eth3_1 up
sudo ip l set eth_gtw_1 up
sudo ip l set eth_gtw_2 up
sudo ip l set eth_gtw_3 up

sudo ip net exec H1_1 ip l set veth1_1 up
sudo ip net exec H1_2 ip l set veth1_2 up
sudo ip net exec H2_1 ip l set veth2_1 up
sudo ip net exec H2_2 ip l set veth2_2 up

sudo ip net exec GTW1 ip l set veth_gtw_1 up
sudo ip net exec GTW1 ip l set veth_gtw_2 up
sudo ip net exec GTW1 ip l set veth_GTW up

sudo ip net exec GTW2 ip l set veth_gtw_3 up
sudo ip net exec GTW2 ip l set eth_GTW up

sudo ip net exec GTW1 ip addr add 192.168.1.254/24 dev veth_gtw_1
sudo ip net exec GTW1 ip addr add 192.168.2.254/24 dev veth_gtw_2

sudo ip net exec GTW2 ip addr add 192.168.3.254/24 dev veth_gtw_3

sudo ip net exec H1_1 ip route add default via 192.168.1.254
sudo ip net exec H1_2 ip route add default via 192.168.1.254
sudo ip net exec H2_1 ip route add default via 192.168.2.254
sudo ip net exec H2_2 ip route add default via 192.168.2.254


sudo ip net exec H3_1 ip l set veth3_1 up
sudo ip net exec H3_1 ip addr add 192.168.3.1/24 dev veth3_1

sudo ip net exec GTW2 ip l set eth_GTW up
sudo ip net exec GTW2 ip addr add 192.168.3.254/24 dev eth_GTW

sudo ip net exec H3_1 ip route add default via 192.168.3.254

sudo ip net exec GTW1 sysctl -w net.ipv4.ip_forward=1
sudo ip net exec GTW2 sysctl -w net.ipv4.ip_forward=1

sudo ip net exec GTW1 ip addr add 192.168.4.1/24 dev veth_GTW
sudo ip net exec GTW2 ip addr add 192.168.4.2/24 dev eth_GTW
sudo ip net exec GTW1 ip route add default via 192.168.4.2
sudo ip net exec GTW2 ip route add default via 192.168.4.1

sudo ip net exec H1_1 ping -c 5 192.168.3.1
