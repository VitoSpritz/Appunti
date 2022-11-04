#inizio con lo script in bash
#sudo chmod +x nomescript.sh per permettere di avviarlo 

sudo ip netns add H1_1
sudo ip netns add H1_2
sudo ip netns add H2_1
sudo ip netns add H2_2
sudo ip netns

#ora abbiamo i 4 host e li possiamo vedere grazie al comando qui sopra
#ora andiamo a fare il primo cavo

sudo ip link add eth1_1 type veth peer name veth1_1
ip link
#ora con il comando qui sopra possiamo vedere che abbiamo 2 nuove interfacce, ovvero eth1_1 e veth1_1 che non sono attaccate, quindi down

#adesso andiamo a creare altri 3 cavi
sudo ip link add eth1_2 type veth peer name veth1_2
sudo ip link add eth2_1 type veth peer name veth2_1
sudo ip link add eth2_2 type veth peer name veth2_2
ip link
#con questo ip link andremo a vedere che abbiamo 10 interfacce, 8 ethernet e 2 di sistema

#andiamo a collegare veth1_1 con H1_1 e a vedere cosa succede
sudo ip link set veth1_1 netns H1_1
ip link
#vedremo che una delle interfacce è sparita, quindi funziona

sudo ip link set veth1_2 netns H1_2
sudo ip link set veth2_1 netns H2_1
sudo ip link set veth2_2 netns H2_2
#adesso ho collegato ogni cavo al suo host

sudo ip netns exec H1_1 ip -c link
#tramite questo comando eseguo un ip link sull'host H1_1 per vedere a quele cavo è collegato

#vado a creare uno switch
sudo ip link add LAN type bridge

#andiamo a collegare la seconda parte dei cavi allo switch
sudo ip link set eth1_1 master LAN
sudo ip link set eth1_2 master LAN
sudo ip link set eth2_1 master LAN
sudo ip link set eth2_2 master LAN

#adesso andiamo ad accendere i cavi settandoli ad UP
sudo ip link set eth1_1 up
sudo ip link set eth1_2 up
sudo ip link set eth2_1 up
sudo ip link set eth2_2 up
sudo ip link set LAN up

#ora dobbiamo fare la stessa cosa ma dalla parte degli host facendo eseguire i comandi in modalità ip netns
sudo ip netns exec H1_1 ip -c link
#con questo vedo quale è l'interfaccia collegata
sudo ip netns exec H1_1 ip link set eth1_1 up
#basta fare questa operazione una sola volta e lo switch andrà up
sudo ip netns exec H1_2 ip link set eth1_2 up
sudo ip netns exec H2_1 ip link set eth2_1 up
sudo ip netns exec H2_2 ip link set eth2_2 up
ip -c l
#adesso vedremo che tutte le porte sono up
