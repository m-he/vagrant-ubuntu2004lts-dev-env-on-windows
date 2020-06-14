Vagrant.configure("2") do |config|
  config.trigger.before :up do |trigger|
      trigger.info = "Creating 'DevNATSwitch' Hyper-V switch if it does not exist..."
      trigger.run = {privileged: "true", powershell_elevated_interactive: "true", path: "./scripts/intSwitch.ps1"}
  end
  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "python-dev"
  config.vm.define "python3-dev"
  config.vm.provider "hyperv" do |h|
    config.vm.network "public_network", bridge: "DevNATSwitch"
    h.enable_virtualization_extensions = true
    h.linked_clone = true
    h.vmname = "PythonDev"
    h.cpus = 4
    h.memory = 2048
    h.maxmemory = 4096
  end
  config.vm.provider "virtualbox" do |v|
    v.name = "PythonDev"
    v.memory = 2048
    v.cpus = 2
  end
  config.vm.provision "shell", path: "./scripts/setup-network.sh"
  config.vm.provision :reload
  config.vm.provision "shell", inline: "apt update"
  config.vm.provision "shell", path: "./scripts/setup-python.sh"
  config.vm.provision "shell", privileged: false, path: "./scripts/setup-xdisplay.sh"
  config.vm.provision "shell", privileged: false, path: "./scripts/setup-direnv.sh"
  config.vm.provision "shell", privileged: false, path: "./scripts/setup-vim.sh"
end