FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]
