$TTL 3600
@       IN      SOA     ns1.celianhache.com. admin.celianhache.com. (
                        2023121601 ; Serial
                        3600       ; Refresh
                        1800       ; Retry
                        604800     ; Expire
                        86400      ; Minimum TTL
)
@       IN      NS      ns1.celianhache.com.
ns1     IN      A       172.18.1.5
@       IN      A       172.18.1.4
@       IN      A       10.0.0.3
