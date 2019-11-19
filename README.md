# Ansible Role: DHCPD
[![Gitlab pipeline status (self-hosted)](https://git.dubzland.net/dubzland/ansible-role-dhcpd/badges/master/pipeline.svg)](https://git.dubzland.net/dubzland/ansible-role-dhcpd)

Installs and configures the ISC DHCP Server.

## Requirements

Ansible version 2.0 or higher.

## Role Variables

Available variables are listed below, along with their default values (see
    `defaults/main.yml` for more info):

### dubzland_dhcpd_interfaces

```yaml
dubzland_dhcpd_interfaces: []
```

Interfaces DHCPD should be configured to listen on

### dubzland_dhcpd_keys

```yaml
dubzland_dhcpd_keys: []
```

Keys to be configured to allow secure IPC.

### dubzland_dhcpd_failovers

```yaml
dubzland_dhcpd_failovers: []
```

List of servers to be configured for DHCP failover.

### dubzland_dhcpd_zones

```yaml
dubzland_dhcpd_zones: []
```

Dynamic DNS zones to keep updated.

###

```yaml
dubzland_dhcpd_subnets: []
```

List of subnets DHCPD is responsible for.

### dubzland_dhcpd_groups

```yaml
dubzland_dhcpd_groups: []
```

Groups of hosts/subnets that should share a common configuration.


## Dependencies

None

## Example Playbook

```yaml
- hosts: dhcp-servers
  become: yes
  roles:
  - role: dubzland.dhcpd
    vars:
      dubzland_dhcpd_interfaces:
        - eth1
      dubzland_dhcpd_failovers:
        - name: my-failover
          primary: 192.168.0.1
          secondary: 192.168.0.2
          split: 128
      dubzland_dhcpd_keys:
        - name: my-dynamic-key
          secret: "{{ my_dynamic_key_secret_value }}"
      dubzland_dhcpd_zones:
        - name: example.com
          primary: 192.168.0.1
          key: my-dynamic-key
        - name: 0.168.192.in-addr.arpa
          primary: 192.168.0.1
          key: my-dynamic-key
      dubzland_dhcpd_groups:
        - options: |
            option domain-name example.com;
          subnets:
            - address: 192.168.0.0/24
              pools:
                - range: 192.168.0.101 192.168.0.200
                  options: |
                    failover peer "my-failover";
              options: |
                option routers 192.168.0.1;
                option domain-name-servers 192.168.0.1;
                option domain-search example.com;
                option ntp-servers 192.168.0.1;
          hosts:
            - hostname: myhost
              address: 192.168.0.12
              mac: 00:11:22:aa:bb:cc
```

## License

MIT

## Author

* [Josh Williams](https://codingprime.com)
