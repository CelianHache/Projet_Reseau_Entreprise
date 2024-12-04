# IP Addressing Plan

## Network Overview
- **Router**: Acts as the gateway between the private subnet, the DMZ subnet and the external network.
- **Private Subnet**: Contains user services (`user1` and `user2`).
- **DMZ Subnet**: Contains a web server (`webserver`) and a DNS server (`dnsserver`).

|Segment|Subnet|Mask|IP Range|Usage|
|-|-|-|-|-|
|Private subnet|172.18.0.0/24|255.255.255.0|172.18.0.1 - 172.18.0.254|Contains user services|
|Private subnet|172.18.1.0/24|255.255.255.0|172.18.1.1 - 172.18.1.254|Contains web server and DNS server|

## Subnet Details

### Private Subnet (`172.18.0.0/24`)
- **IP Range**: `172.18.0.1` to `172.18.0.254`
- **Gateway (Router)**: `172.18.0.1`
- **Broadcast**: `172.18.0.255`

---

### DMZ Subnet (`172.18.1.0/24`)
- **IP Range**: `172.18.1.1` to `172.18.1.254`
- **Gateway (Router)**: `172.18.1.1`
- **Broadcast**: `172.18.1.255`