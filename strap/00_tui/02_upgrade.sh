#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Upgrade packages."
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y