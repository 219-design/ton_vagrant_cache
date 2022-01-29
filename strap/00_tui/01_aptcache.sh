#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Install Debian configuration utilities."
sudo apt-get install -y debconf-utils

echo "Install the apt cacher."
echo apt-cacher-ng apt-cacher-ng/tunnelenable boolean false | sudo debconf-set-selections
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y apt-cacher-ng

echo "Configure the apt cacher."
sudo sed -e "/AdminAuth/c AdminAuth: administrator:password" /etc/apt-cacher-ng/security.conf

echo "Configure apt-get for apt-cacher-ng."
echo 'Acquire::http::Proxy "http://192.168.63.99:3142";' | sudo tee /etc/apt/apt.conf.d/00proxy
echo 'Acquire::HTTP::Proxy::personal.repository.local "DIRECT";' | sudo tee -a /etc/apt/apt.conf.d/00proxy

echo '@reboot wget "http://192.168.63.99:3142/acng-report.html?abortOnErrors=aOe&byPath=bP&byChecksum=bS&truncNow=tN&incomAsDamaged=iad&purgeNow=pN&doExpire=Start+Scan+and%2For+Expiration&calcSize=cs&asNeeded=an#bottom"' \
    |& sudo tee /etc/cron.d/aptcacherng_repair
