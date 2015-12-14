ANSIBLE=ansible-playbook -i inventory

.PHONY: setup test update endpoints baseline manage-users vpc-deploy check-playbooks

export EC2_INI_PATH=./ec2.ini

setup:
	./extensions/setup/setup.sh

update:
	./extensions/setup/role_update.sh

test: check-playbooks
	./extensions/test/execute_tests.sh

check-playbooks:
	./extensions/test/check_playbooks.sh

endpoints:
	$(ANSIBLE) -l $(HOST) playbooks/vpn-endpoints.yml

baseline:
	$(ANSIBLE) -k -l $(HOST) playbooks/baseline.yml

endpoint-prepare:
	$(ANSIBLE) -l $(HOST) playbooks/endpoint-prepare.yml

manage-users:
	$(ANSIBLE) playbooks/manage-users.yml

vpc-deploy: 
	cd terraform && $(MAKE) apply
	echo "Waiting for resources to be available" && sleep 120
	EC2_INI_PATH="./ec2_public.ini" $(ANSIBLE) playbooks/vpc-base.yml
	EC2_INI_PATH="./ec2_public.ini" $(ANSIBLE) playbooks/fetch-vpn-config.yml
