#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Update apt-get packages."
sudo apt-get update