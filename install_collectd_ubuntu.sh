#! /bin/bash

#Provided by @mrlesmithjr
#EveryThingShouldBeVirtual.com

# This script will install collect on a Ubuntu system

set -e

# Setting colors for output
red="$(tput setaf 1)"
yellow="$(tput bold ; tput setaf 3)"
NC="$(tput sgr0)"

# Install dependencies
apt-get install --yes flex bison libperl-dev python-dev libdbi-dev libyajl-dev libxml2-dev libmysqlclient-dev iptables-dev git make build-essential automake libtool pkg-config libgcrypt11-dev curl libesmtp-dev liboping-dev libpcap0.8-dev libcurl4-gnutls-dev

# Download, build and install collectd
cd /opt
git clone git://github.com/collectd/collectd.git
cd collectd
git co 5.2.x
./clean.sh
./build.sh
./configure --enable-curl --enable-curl_json --enable-curl_xml --enable-dbi --enable-python --enable-mysql --enable-smtp --enable-ping
make
make install

# All Done
echo "Installation has completed!!"
echo "${yellow}EveryThingShouldBeVirtual.com${NC}"
echo "${yellow}@mrlesmithjr${NC}"
echo "${yellow}Enjoy!!!${NC}"