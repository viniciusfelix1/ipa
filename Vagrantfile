# -*- mode: ruby -*-
# vi: set ft=ruby :
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
require 'yaml'
ipamachines = YAML.load_file("machines.yml")

Vagrant.configure("2") do |config|
	ipamachines.each do |machines|
		config.vm.define machines["name"] do |server|
			server.vm.hostname = machines["name"]
			server.vm.box = machines["so"]
			server.vm.network "private_network", ip: machines["ip"], dns: "8.8.8.8"

			server.vm.provider "virtualbox" do |vb|
				vb.customize ["modifyvm", :id, "--groups", "/ipa"]
				vb.memory = machines["memory"]
				vb.cpus = machines["cpus"]
				vb.name = machines["name"]
			end

      if machines["name"] == "ipaserver"
        server.vm.provision "shell", inline: "bash /vagrant/server.sh"
      end

			if machines["name"] == "ipaclient1"
        server.vm.provision "shell", inline: "bash /vagrant/ipaclient1.sh"
      end

			if machines["name"] == "ipaclient2"
 			 server.vm.provision "shell", inline: "bash /vagrant/ipaclient2.sh"
 	    end
		end
 end
end
