# Platform

## Setup

1. [Install Terraform](https://www.terraform.io/intro/getting-started/install.html)

	```
	brew install terraform terraform-inventory
	```
	
2. Install Ansible

	```
	sudo easy_install pip
	sudo pip install ansible
	```
	
## Usage

#### Run playbook given dyanmic inventory

```
TF_STATE={path to .tfstate file} ansible-playbook --inventory-file=$(which terraform-inventory) {path to playbook file}
```