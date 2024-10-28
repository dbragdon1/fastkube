#!/bin/bash

# stop stdin host authenticity popup for 
# newly spunup vpcs
ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -u root -i ansible/inventory.ini ansible/playbook.yml 
