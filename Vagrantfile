Vagrant.configure("2") do |config|
  config.vm.box = "opscode-ubuntu-14.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
  config.vm.network :forwarded_port, guest: 80, host: 8880
  config.omnibus.chef_version = :latest
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision :chef_client do |chef|
    chef.provisioning_path = "/etc/chef"
    chef.chef_server_url = "https://api.opscode.com/organizations/emobisys"
    chef.validation_key_path = "./.chef/emobisys-validator.pem"
    chef.validation_client_name = "emobisys-validator"
    chef.node_name = "dieple"
    #chef.cookbooks_path = ["../chef/site-cookbooks", "../chef/cookbooks"]
    #chef.add_recipe "redis"
    chef.add_role "vagrant-test"
    #chef.add_recipe "users"
    #chef.add_recipe "nginx"
    chef.environment = "development"
    chef.log_level = :debug
  end
end
