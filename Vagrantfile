Vagrant.configure("2") do |config|

  config.vm.define "node01" do |node01|
    node01.vm.box = "ARTACK/debian-jessie"
    node01.vm.hostname = "node01"
    node01.vm.network :private_network, ip: "192.168.0.42"

    node01.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--cpuexecutioncap", "50",
        "--memory", "256",
      ]
    end

    node01.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end
end