ANSIBLE=ansible-playbook -i inventory

.PHONY: setup test update endpoints baseline manage-users vpc-deploy check-playbooks

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
