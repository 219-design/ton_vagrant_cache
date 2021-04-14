# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "cache" do |acn|
        acn.vm.provider "virtualbox" do |vb, override|
            VirtualBox::config_defaults(override)
            VirtualBox::vm_defaults(override)
            vb.name = "cache"
            vb.cpus = 1
            vb.memory = 512
        end
        acn.vm.network "private_network", ip: "192.168.99.99"
        acn.vm.synced_folder __dir__, "/vmconfig"
        find_provisioners(acn, __dir__)
    end
end