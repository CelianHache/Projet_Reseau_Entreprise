FROM ubuntu:24.04

RUN apt-get update 
RUN apt update -y 
RUN apt install -y apache2
RUN apt -y install wget iproute2 inetutils-ping curl host mtr-tiny tcpdump iptables tshark

WORKDIR /var/www/html

COPY ./index.html index.html