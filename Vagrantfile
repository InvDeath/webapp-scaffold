# -*- mode: ruby -*-
# vi: set ft=ruby :
is_windows = Vagrant::Util::Platform.windows?

$script = <<SCRIPT
  curl -sSL https://get.docker.com/ | sh

  # Install docker-compose
  sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.4.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
  sudo chmod +x /usr/local/bin/docker-compose
  sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/1.4.1/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

  # Install docker-cleanup command
  cd /tmp
  git clone https://gist.github.com/76b450a0c986e576e98b.git
  cd 76b450a0c986e576e98b
  sudo mv docker-cleanup /usr/local/bin/docker-cleanup
  sudo chmod +x /usr/local/bin/docker-cleanup
  
  gem install tmuxinator
SCRIPT

Vagrant.configure('2') do |config|

  config.vm.box = 'ubuntu/vivid64'

  config.vm.network 'private_network', ip: '192.168.33.10'

  if is_windows
    config.vm.synced_folder '.', '/home/vagrant/share', :mount_options => ["fmode=666"]#, type: 'smb' # u can uncomment it
  else
    config.vm.synced_folder '.', '/home/vagrant/share', :nfs => { :mount_options => ['nolock','vers=3','udp','noatime','actimeo=1'] }
  end

  config.ssh.forward_agent = true

  config.vm.provision "shell", inline: $script
end