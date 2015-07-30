Vagrant.configure("2") do |config|

  N = 2
  (1..N).each do |machine_id|
    config.vm.define "node0#{machine_id}" do |node|
      node.vm.box = "ARTACK/debian-jessie"
      node.vm.hostname = "machine0#{machine_id}"
      node.vm.network "private_network", ip: "192.168.77.#{20+machine_id}"

      node.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "50",
          "--memory", "256",
        ]
      end

      node.vm.provision :ansible do |ansible|
        ansible.playbook = "playbook.yml"

        ansible.groups = {
          "supernodes" => ["node01", "node02"],
        }
      end
    end
  end
end