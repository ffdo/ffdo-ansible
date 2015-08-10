Vagrant.configure("2") do |config|

  N = 2
  (1..N).each do |machine_id|
    config.vm.define "node0#{machine_id}" do |node|
      node.vm.box = "ARTACK/debian-jessie"
      node.vm.hostname = "node0#{machine_id}"
      node.vm.network "private_network", ip: "192.168.77.#{20+machine_id}"

      node.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", "128",
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

  U = 1
  (1..U).each do |machine_id|
    config.vm.define "uplink0#{machine_id}" do |node|
      node.vm.box = "ARTACK/debian-jessie"
      node.vm.hostname = "uplink0#{machine_id}"
      node.vm.network "private_network", ip: "192.168.77.#{30+machine_id}"

      node.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", "128",
        ]
      end

      node.vm.provision :ansible do |ansible|
        ansible.playbook = "playbook.yml"

        ansible.groups = {
          "uplinks" => ["uplink01"]
        }
      end
    end
  end

  config.vm.define "mapserver" do |node|
    node.vm.box = "ARTACK/debian-jessie"
    node.vm.hostname = "mapserver"
    node.vm.network "private_network", ip: "192.168.77.29"

    node.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--memory", "128",
      ]
    end

    node.vm.provision :ansible do |ansible|
      ansible.playbook = "playbook.yml"

      ansible.groups = {
        "mapservers" => ["mapserver"]
      }
    end
  end
end