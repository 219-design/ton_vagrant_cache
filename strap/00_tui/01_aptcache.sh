#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Install the apt cacher."
sudo apt-get install -y apt-cacher-ng

echo "Configure the apt cacher."
sudo sed -e "/AdminAuth/c AdminAuth: administrator:password" /etc/apt-cacher-ng/security.conf

echo "Configure apt-get for apt-cacher-ng."
echo 'Acquire::http::Proxy "http://192.168.99.99:3142";' | sudo tee /etc/apt/apt.conf.d/00proxy
echo 'Acquire::HTTP::Proxy::personal.repository.local "DIRECT";' | sudo tee -a /etc/apt/apt.conf.d/00proxy