FROM debian:stretch

RUN apt-get update && \
	apt-get -y dist-upgrade && \
	apt-get install -y \
		debconf-utils \
		gnupg \
		python-jmespath \
		python-netaddr && \
	echo 'resolvconf resolvconf/linkify-resolvconf boolean false' | debconf-set-selections && \
	echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list.d/ansible.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
	apt-get update && \
	apt-get install -y ansible

WORKDIR /usr/src/dubzland-dhcpd

RUN mkdir -p /usr/src/dubzland-dhcpd

ADD . /usr/src/dubzland-dhcpd

ENV ANSIBLE_ROLES_PATH=/usr/src
