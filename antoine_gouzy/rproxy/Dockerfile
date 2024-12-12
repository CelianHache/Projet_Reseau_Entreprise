FROM nginx:1.27

RUN apt-get update 
RUN apt -y update
RUN apt -y install iproute2 tshark

#COPY rproxy.conf /etc/nginx/sites-available/reverse-proxy.conf
#RUN ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/

COPY rproxy.conf /etc/nginx/conf.d/default.conf