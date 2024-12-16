FROM nginx:latest


RUN apt-get update && \
    apt-get install -y wget iproute2 tshark dnsutils

EXPOSE 80

COPY nginx.conf /etc/nginx/conf.d/default.conf
