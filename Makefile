.PHONY: plan apply playbook.main

plan:
	cd ./terraform && \
		terraform plan

apply:
	cd ./terraform && \
		terraform apply

playbook.main: export TF_STATE=./terraform/terraform.tfstate
playbook.main:
	ansible-playbook --inventory-file=$$(which terraform-inventory) \
		-u root \
		./ansible/main.yml
