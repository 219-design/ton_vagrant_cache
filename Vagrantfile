# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config_defaults(config)
    config.vm.define "cache" do |acn|
        vm_defaults(acn.vm)
        acn.vm.provider "virtualbox" do |vb|
            vb.name = "cache"
            vb.cpus = 1
            vb.memory = 512
        end
        acn.vm.network "private_network", ip: "192.168.99.99"
        acn.vm.synced_folder __dir__, "/vmconfig"
        find_providers(acn, __dir__)
    end
end