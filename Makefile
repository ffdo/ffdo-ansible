INVENTORY?=dortmund

ANSIBLE=ansible-playbook -i inventories/$(INVENTORY)

.PHONY: setup test update manage-users check-playbooks

setup:
	./extensions/setup/setup.sh

update:
	./extensions/setup/role_update.sh

test: check-playbooks
	./extensions/test/execute_tests.sh

check-playbooks:
	./extensions/test/check_playbooks.sh

manage-users:
	$(ANSIBLE) playbooks/manage-users.yml

mapserver:
	$(ANSIBLE) playbooks/mapserver.yml

supernodes:
	$(ANSIBLE) playbooks/supernode.yml
