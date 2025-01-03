FROM ubuntu/bind9:latest

# COPY named.conf.local /etc/bind/named.conf.local
# COPY named.conf.options /etc/bind/named.conf.options
# COPY db.celianhache.com /etc/bind/db.celianhache.com

COPY named.conf /etc/bind/named.conf
COPY db.celianhache.com.internal /etc/bind/db.celianhache.com.internal
COPY db.celianhache.com.external /etc/bind/db.celianhache.com.external
