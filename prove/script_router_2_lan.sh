#!bin/bash



sudo ip net add H1_1
sudo ip net add H1_2
sudo ip net add H2_1
sudo ip net add H2_2
sudo ip net add GTW

sudo ip l add eth1_1 type veth peer name veth1_1
sudo ip l add eth1_2 type veth peer name veth1_2
sudo ip l add eth2_1 type veth peer name veth2_1
sudo ip l add eth2_2 type veth peer name veth2_2

sudo ip l add LAN1 type bridge
sudo ip l add LAN2 type bridge

sudo ip l set veth1_1 netns H1_1
sudo ip l set veth1_2 netns H1_2
sudo ip l set veth2_1 netns H2_1
sudo ip l set veth2_2 netns H2_2

sudo ip l set eth1_1 master LAN1
sudo ip l set eth1_2 master LAN1
sudo ip l set eth2_1 master LAN2
sudo ip l set eth2_2 master LAN2

sudo ip l set eth1_1 up
sudo ip l set eth1_2 up
sudo ip l set eth2_2 up
sudo ip l set eth2_2 up

sudo ip l set LAN1 up
sudo ip l set LAN2 up

sudo ip netns exec H1_1 ip l set veth1_1 up
sudo ip netns exec H1_2 ip l set veth1_2 up
sudo ip netns exec H2_1 ip l set veth2_1 up
sudo ip netns exec H2_2 ip l set veth2_2 up

sudo ip netns exec H1_1 ip addr add 192.168.10.1/24 dev veth1_1
sudo ip netns exec H1_2 ip addr add 192.168.10.2/24 dev veth1_2
sudo ip netns exec H2_1 ip addr add 192.168.20.1/24 dev veth2_1
sudo ip netns exec H2_2 ip addr add 192.168.20.2/24 dve veth2_2

sudo ip link add veth_gtw_1 type veth peer eth_gtw_1
sudo ip link add veth_gtw_2 type veth peer eth_gtw_2

sudo ip l set eth_gtw_1 master LAN1
sudo ip l set eth_gtw_2 master LAN2

sudo ip l set veth_gtw_1 netns GTW
sudo ip l set veth_gtw_2 netns GTW

sudo ip link set eth_gtw_1 up
sudo ip link set eth_gtw_2 up

sudo ip netns exec GTW ip link set veth_gtw_1 up
sudo ip netns exec GTW ip link set veth_gtw_2 up

sudo ip net exec GTW ip l addr add 192.168.1.254/24 dev veth_gtw_1
sudo ip net exec GTW ip l addr add 192.168.2.254/24 dev veth_gtw_2

sudo ip net exec H1_1 ip route add default via 192.168.10.254
sudo ip net exec H1_2 ip route add default via 192.168.10.254
sudo ip net exec H2_1 ip route add default via 192.168.20.254
sudo ip net exec H2_2 ip route add default via 192.168.20.254

sudo ip net exec GTW sysctl -w net.ipv4.ip_forward=1

#ora con i ping dovrebbe andare

