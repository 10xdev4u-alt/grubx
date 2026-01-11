Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  # Sync the current folder to /vagrant
  config.vm.synced_folder ".", "/vagrant"

  # Provision: Install the theme
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y grub-common
    cd /vagrant
    ./install.sh
  SHELL
end
