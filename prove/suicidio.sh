#!/bin/bash



sudo ip -all netns delete

sudo ip l del LAN3



sudo ip net add H1_1

sudo ip net add H1_2

sudo ip net add H4_1

sudo ip net add GTW1

sudo ip net add GTW3



sudo ip l add eth1_1 type veth peer veth1_1

sudo ip l add eth4_1 type veth peer veth4_1



sudo ip l set veth1_1 netns H1_1

sudo ip l set eth1_1 netns GTW1

sudo ip l set veth4_1 netns H1_1

sudo ip l set eth4_1 netns H4_1



sudo ip net exec H1_1 ip l set veth1_1 up

sudo ip net exec H1_1 ip l set veth4_1 up

sudo ip net exec H4_1 ip l set eth4_1 up

sudo ip net exec GTW1 ip l set eth1_1 up



sudo ip net exe GTW1 ip addr add 137.204.1.254/24 dev eth1_1

sudo ip net exec GTW1 sysctl -w net.ipv4.ip_forward=1



sudo ip net exec H1_1 ip addr add 137.204.1.1/24 dev veth1_1

sudo ip net exec H4_1 ip addr add 137.204.4.1/24 dev eth4_1

sudo ip net exec H1_1 ip addr add 137.204.1.2/24 dev veth4_1



sudo ip net exec H1_1 ip r add 137.204.4.0/24 via 137.204.1.2 dev veth4_1

sudo ip net exec H4_1 ip r add 137.204.1.0/24 via 137.204.4.1

# sudo ip net exec H1_1 ping -c 2 137.204.4.1



sudo ip net exec H1_1 ip r add 137.204.2.0/24 via 137.204.1.254 dev veth1_1

sudo ip net exec H1_1 ip r add 137.204.3.0/24 via 137.204.1.254 dev veth1_1



sudo ip l add veth1_gtw3 type veth peer eth1_gtw3

sudo ip l set veth1_gtw3 netns GTW1

sudo ip l set eth1_gtw3 netns GTW3



sudo ip net exec GTW1 ip l set veth1_gtw3 up

sudo ip net exec GTW3 ip l set eth1_gtw3 up



sudo ip net exec GTW1 ip addr add 137.204.5.1/24 dev veth1_gtw3

sudo ip net exec GTW3 ip addr add 137.204.5.2/24 dev eth1_gtw3



sudo ip l add LAN3 type bridge

sudo ip net add H3_1

sudo ip net add GTW2



sudo ip l add veth3_gtw type veth peer eth3_gtw

sudo ip l set veth3_gtw netns GTW3

sudo ip net exec GTW3 ip l set veth3_gtw up

sudo ip l set eth3_gtw master LAN3

sudo ip l set eth3_gtw up

sudo ip net exec GTW3 ip addr add 137.204.3.254/24 dev veth3_gtw

sudo ip net exec GTW3 sysctl -w net.ipv4.ip_forward=1



sudo ip l add veth3_gtw2 type veth peer eth3_gtw2

sudo ip l set veth3_gtw2 netns GTW2

sudo ip net exec GTW2 ip l set veth3_gtw2 up

sudo ip l set eth3_gtw2 master LAN3

sudo ip l set eth3_gtw2 up

sudo ip net exec GTW2 ip addr add 137.204.3.253/24 dev veth3_gtw2



sudo ip l add veth3_1 type veth peer eth3_1

sudo ip l set veth3_1 netns H3_1

sudo ip net exec H3_1 ip l set veth3_1 up

sudo ip l set eth3_1 master LAN3

sudo ip l set eth3_1 up

sudo ip net exec H3_1 ip addr add 137.204.3.1/24 dev veth3_1

sudo ip net exec H3_1 ip r add 137.204.1.0/24 via 137.204.3.254

sudo ip net exec H3_1 ip r add 137.204.2.0/24 via 137.204.3.253

sudo ip net exec H3_1 ip r add 137.204.4.0/24 via 137.204.3.254



sudo ip l set LAN3 up



sudo ip net exec GTW1 ip r add 137.204.3.0/24 via 137.204.5.2

sudo ip net exec GTW1 ip r add 137.204.2.0/24 via 137.204.5.2

sudo ip net exec GTW1 ip r add 137.204.4.0/24 via 137.204.1.1



sudo ip net exec GTW3 ip r add 137.204.1.0/24 via 137.204.5.1

sudo ip net exec GTW3 ip r add 137.204.4.0/24 via 137.204.5.1

sudo ip net exec GTW3 ip r add 137.204.2.0/24 via 137.204.3.253

sudo ip net exec GTW3 ip r add 137.204.3.0/24 via 137.204.3.254



sudo ip net exec H4_1 ip r add 137.204.2.0/24 via 137.204.4.1

sudo ip net exec H4_1 ip r add 137.204.3.0/24 via 137.204.4.1



sudo ip net add H2_1



sudo ip l add veth2_1 type veth peer eth2_1

sudo ip l set veth2_1 netns H2_1

sudo ip l set eth2_1 netns GTW2

sudo ip net exec H2_1 ip l set veth2_1 up

sudo ip net exec GTW2 ip l set eth2_1 up

sudo ip net exec GTW2 sysctl -w net.ipv4.ip_forward=1

sudo ip net exec H1_1 sysctl -w net.ipv4.ip_forward=1



sudo ip net exec H2_1 ip addr add 137.204.2.1/24 dev veth2_1

sudo ip net exec GTW2 ip addr add 137.204.2.254/24 dev eth2_1

sudo ip net exec H2_1 ip r add 137.204.3.0/24 via 137.204.2.254

sudo ip net exec H2_1 ip r add 137.204.1.0/24 via 137.204.2.254

sudo ip net exec H2_1 ip r add 137.204.4.0/24 via 137.204.2.254



sudo ip net exec GTW2 ip r add 137.204.3.0/24 via 137.204.3.253

sudo ip net exec GTW2 ip r add 137.204.4.0/24 via 137.204.3.254

sudo ip net exec GTW2 ip r add 137.204.1.0/24 via 137.204.3.254

sudo ip net exec GTW2 ip r add 137.204.2.0/24 via 137.204.2.254



sudo ip net exec H2_1 ip r add default via 137.204.2.254







