#!/bin/bash

set -e

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i ansible/inventory.ini ansible/playbook.yml
