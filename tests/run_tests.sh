#!/bin/sh
ansible-playbook -i /usr/src/dubzland-dhcpd/tests/inventory.yml /usr/src/dubzland-dhcpd/tests/test_primary.yml
ansible-playbook -i /usr/src/dubzland-dhcpd/tests/inventory.yml /usr/src/dubzland-dhcpd/tests/test_secondary.yml
