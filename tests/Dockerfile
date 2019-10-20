FROM jdubz/gitlab-debian-ansible:latest

WORKDIR /usr/src/dubzland-dhcpd

RUN mkdir -p /usr/src/dubzland-dhcpd

ADD . /usr/src/dubzland-dhcpd

ENV ANSIBLE_ROLES_PATH=/usr/src
