Vagrant.configure("2") do |config|
  config.trigger.before :up do |trigger|
      trigger.info = "Creating 'DevNATSwitch' Hyper-V switch if it does not exist..."
      trigger.run = {privileged: "true", powershell_elevated_interactive: "true", path: "./scripts/intSwitch.ps1"}
  end
  config.vm.box = "generic/ubuntu2004"
  config.vm.hostname = "dev-host"
  config.vm.define "development-host"
  config.vm.provider "hyperv" do |h|
    config.vm.network "public_network", bridge: "DevNATSwitch"
    h.enable_virtualization_extensions = true
    h.linked_clone = true
    h.vmname = "DevHost"
    h.cpus = 4
    h.memory = 2048
    h.maxmemory = 6142
  end
  if (File.file?('.vagrant\machines\development-host\hyperv\action_provision'))
    config.vm.synced_folder 'projects', '/projects', {
      type: 'smb', mount_options: ['vers=3.0'],
      smb_username: ENV['VAGRANT_SMB_USERNAME'],
      smb_password: ENV['VAGRANT_SMB_PASSWORD']
    }
    config.vm.post_up_message = "Your VM is ready for use."
  else
    config.vm.provision "shell", path: "./scripts/setup-network.sh"
    config.vm.provision :reload
    config.vm.provision "shell", path: "./scripts/setup-python.sh"
    config.vm.provision "shell", privileged: false, path: "./scripts/setup-xdisplay.sh"
    config.vm.provision "shell", privileged: false, path: "./scripts/setup-direnv.sh"
    config.vm.provision "shell", privileged: false, path: "./scripts/setup-vim.sh"
    config.vm.provision "shell", privileged: false, path: "./scripts/setup-zsh.sh"
    config.vm.post_up_message = "VM is initialized but not ready.  Please run `vagrant reload` to finalize."
  end

end