FROM ubuntu:24.04

RUN apt-get update 
RUN apt -y update
RUN apt -y install wget iproute2 inetutils-ping curl host mtr-tiny tcpdump iptables traceroute w3m isc-dhcp-server tshark

#Config DHCP
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
COPY isc-dhcp-server /etc/default/isc-dhcp-server 