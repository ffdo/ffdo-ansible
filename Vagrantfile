ANSIBLE_INVENTORY_DIR = 'inventories/vagrant'

Vagrant.configure("2") do |config|

  N = 2
  # box_name = "ARTACK/debian-jessie"
  box_name = "debian/jessie64"
  (1..N).each do |machine_id|
    config.vm.define "snode0#{machine_id}-1.ffdo.de" do |node|
      node.vm.box = box_name
      node.vm.hostname = "snode0#{machine_id}-1.ffdo.de"
      # node.vm.network "private_network", ip: "192.168.77.#{20+machine_id}"

      node.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", "128",
        ]
      end
    end
  end

  config.vm.define "map.ffdo.de" do |node|
    node.vm.box = box_name
    node.vm.hostname = "map.ffdo.de"
    # node.vm.network "private_network", ip: "192.168.77.29"

    node.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--memory", "128",
      ]
    end
  end

=begin
  config.vm.provision :ansible do |ansible|
    ansible.inventory_path = ANSIBLE_INVENTORY_DIR
    ansible.groups = {
      "mapservers" => ["mapserver"],
      "supernodes" => ["node01", "node02"],
    }
    ansible.playbook = "playbooks/supernode.yml"
  end
=end
end