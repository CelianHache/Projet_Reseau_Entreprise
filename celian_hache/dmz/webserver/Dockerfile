FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y apache2 wget iputils-ping iproute2 iptables traceroute && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

    
WORKDIR /var/www/html
    
COPY ./index.html .