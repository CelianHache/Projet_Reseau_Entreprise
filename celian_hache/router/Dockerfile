FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y wget iputils-ping iproute2 iptables traceroute isc-dhcp-server systemctl tshark

WORKDIR /home/user
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
COPY isc-dhcp-server /etc/default/isc-dhcp-server
