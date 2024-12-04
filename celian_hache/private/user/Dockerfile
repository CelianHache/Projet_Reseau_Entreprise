FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y iputils-ping

WORKDIR /home/user  

CMD ["tail", "-f", "/dev/null"]
