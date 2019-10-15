#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function run_script() {
    script=$1
    echo "START $script"
    cat "$script" | sudo -i -u vagrant bash
    echo "END $script"
}

function run_directory() {
    strap_dir=$1
    echo "START $strap_dir"
    for script in $(ls $strap_dir/*.sh | sort)
    do
        run_script "$script"
    done
    echo "END $strap_dir"
}

run_directory /vmconfig/$1 | tee -a /vagrant/provision.log