#!/bin/bash 
 sudo ip net add H1_1
  sudo ip net add H1_2
  sudo ip net add H2_2
  sudo ip net add H2_1
  sudo ip l add LAN1 type bridge
  sudo ip l add LAN2 type bridge
  sudo ip net add GTW1
  sudo ip net add GTW2
  
  sudo ip l add eth1_1 type veth peer veth1_1
  sudo ip l add eth1_2 type veth peer veth1_2
  sudo ip l add eth2_2 type veth peer veth2_2
  sudo ip l add eth2_1 type veth peer veth2_1
  
  sudo ip l add eth1_gtw1 type veth peer veth1_gtw1
  sudo ip l add eth1_gtw2 type veth peer veth1_gtw2
  
  sudo ip l set veth1_1 netns H1_1
  sudo ip l set veth1_2 netns H1_2
  sudo ip l set veth2_2 netns H2_2
  sudo ip l set veth2_1 netns H2_1
  sudo ip l set eth1_1 master LAN1
  sudo ip l set eth1_2 master LAN1
  sudo ip l set eth2_2 master LAN2
  sudo ip l set eth2_1 master LAN2
  
  sudo ip l set eth1_1 up
  sudo ip l set eth1_2 up
  sudo ip l set eth2_2 up
  sudo ip l set eth2_1 up
  
  sudo ip net exec H1_1 ip l set veth1_1 up
  sudo ip net exec H1_2 ip l set veth1_2 up
  sudo ip net exec H2_2 ip l set veth2_2 up
  sudo ip net exec H2_1 ip l set veth2_1 up
  
  sudo ip net exec H1_1 ip addr add 192.168.1.1/24 dev veth1_1
  sudo ip net exec H1_2 ip addr add 192.168.1.2/24 dev veth1_2
  sudo ip net exec H2_2 ip addr add 192.168.2.2/24 dev veth2_2
  sudo ip net exec H2_1 ip addr add 192.168.2.1/24 dev veth2_1
  
  sudo ip l set eth1_gtw1 master LAN1
  ip -c l
  sudo ip l set eth1_gtw1 up
  sudo ip l set eth2_gtw1 master LAN2
  sudo ip l set eth2_gtw2 master LAN2
  sudo ip l set eth1_gtw2 master LAN2
  sudo ip l set eth1_gtw2 master up
  sudo ip l set eth1_gtw2 up
  sudo ip l set veth1_gtw1 netns GTW1
  ip net
  
  sudo ip l set veth1_gtw2 netns GTW2
  sudo ip net exec GTW1 ip addr add 192.168.1.254/24 dev veth1_gtw1
  sudo ip net exec GTW2 ip addr add 192.168.2.254/24 dev veth1_gtw2
  sudo ip net exec H1_1 ip route add default via 192.168.1.254
  sudo ip net exec H1_2 ip route add default via 192.168.1.254
  sudo ip net exec H2_2 ip route add default via 192.168.2.254
  sudo ip net exec H2_1 ip route add default via 192.168.2.254
  ip -c l
  sudo ip l set LAN1 up
  sudo ip l set LAN2 up
  
  sudo ip l set eth1_gtw1 up
  sudo ip l set eth1_gtw2 up
  ip -c l
  sudo ip net exec GTW1 ip -c l
  sudo ip net exec GTW1 ip l set veth1_gtw1 up
  sudo ip net exec GTW2 ip l set veth1_gtw2 up
  sudo ip -c l
  sudo ip net exec H1_1 ping 192.168.1.2
  sudo ip net exec H2_1 ping 192.168.2.2
  sudo ip l add Transport
  sudo ip l add Transport type bridge
  sudo ip l add eth_t1 type veth peer veth_t1
  sudo ip l add eth_t2 type veth peer veth_t2
  sudo ip l set eth_t1 master Transport
  sudo ip l set veth_t1 netns GTW1
  sudo ip l set eth_t1 up
  sudo ip net exec GTW1 ip l set veth_t1 up
  sudo ip net exec GTW1 ip addr ad 192.168.4.1/24 dev veth_t1
  sudo ip l set eth_t2 master Transport
  sudo ip l set veth_t2 netns GTW2
  sudo ip l set eth_t2 up
  sudo ip net exec GTW2 ip l set vet_t2 up
  sudo ip net exec GTW2 ip l set veth_t2 up
  sudo ip net exec GTW2 ip addr add 192.168.4.2/24 dev veth_t2
  sudo ip net exec GTW2 ip -c a
  sudo ip net exec GTW1 ip route add default via 192.168.4.2
  sudo ip net exec GTW2 ip route add default via 192.168.4.1
  sudo ip l set Transport up
  sudo ip net exec H1_1 ping 192.168..1
  sudo ip net exec H1_1 ping 192.168.2.1
  sudo ip net exec H1_1 ip r
  sudo ip net exec H1_1 ip -c a
  sudo ip net exec H1_1 ip -c r a
  sudo ip net exec H1_1 ip -c r
  sudo ip net exec GTW2 sysctl -w net.ipv4.ip_forward=1
  sudo ip net exec GTW1 sysctl -w net.ipv4.ip_forward=1
  sudo ip net exec H1_1 ping 192.168.2.1
  sudo ip net add H3_1
  sudo ip l add LAN3 type bridge
  sudo ip net add GTW3
  sudo ip l add eth3_1 type veth peer veth3_1
  sudo ip l set eth3_1 master LAN
  sudo ip l set eth3_1 master LAN3
  sudo ip l set veth3_1 net H3_1
  sudo ip l set veth3_1 netns H3_1
  sudo ip l set eth3_1 up
  sudo ip net exec H3_1 ip l set veth3_1 up
  sudo ip l add eth3_gtw3 type veth peer veth3_gtw3
  sudo ip l set eth3_gtw3 master LAN3
  sudo ip l set eth3_gtw3 up
  sudo ip l set veth3_gtw3 netns GTW3
  sudo ip net exec GTW3 ip l set veth3_gtw3 up
  sudo ip net exec H3_1 ip addr add 192.168.3.1/24 dev veth3_1
  sudo ip net exec GTW3 ip addr add 192.168.3.254/24 dev veth3_gtw3
  sudo ip net exec H3_3 ip route add default via 192.168.3.254
  sudo ip net exec H3_1 ip route add default via 192.168.3.254
  sudo ip net exec H3_1 ip -c a
  sudo ip net exec H3_1 ip -c r
  sudo ip net exec GTW3 ip -c a
  sudo ip net exec GTW3 ip -c r
  sudo ip -c l
  sudo ip l set LAN3 up
  sudo ip net exec GTW3 ip -c l
  sudo ip l add eth_t3 type veth peer veth_t3
  sudo ip l set eth_t3 master Transport
  sudo ip l set veth_t3 netns GTW3
  sudo ip net exec GTW3 ip addr set 192.168.4.3/24 dev veth_t3
  sudo ip net exec GTW3 ip addr add set 192.168.4.3/24 dev veth_t3
  sudo ip net exec GTW3 ip addr add 192.168.4.3/24 dev veth_t3
  sudo ip net exec GTW3 ip l set veth_t3 up
  sudo ip l set eth_t3 up
  
  sudo ip net exec GTW3 ip route add 192.168.2.0/24 via 192.168.4.2
  sudo ip net exec GTW3 ip route add 192.168.1.0/24 via 192.168.4.1
  sudo ip net exec GTW2 ip route add 192.168.1.0/24 via 192.168.4.1 
  sudo ip net exec GTW2 ip route add 192.168.3.0/24 via 192.168.4.3 
  sudo ip net exec GTW1 ip route add 192.168.3.0/24 via 192.168.4.3 
  sudo ip net exec GTW1 ip route add 192.168.2.0/24 via 192.168.4.2
  
  sudo ip net exec GTW3 ip -c a
  sudo ip net exec GTW3 ip -c r
  sudo ip net exec GTW3 route del default
  sudo ip net exec GTW2 route del default
  sudo ip net exec GTW1 route del default
  
  sudo ip net exec GTW3 sysctl -w net.ipv4.ip_forward=1hi
  sudo ip net exec H3_1 ping 192.168.1.1
  sudo ip net exec H2_1 ping 192.168.1.1
  sudo ip net exec H2_1 ping 192.168.3.1
