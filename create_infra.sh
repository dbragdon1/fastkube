#!/bin/bash

terraform -chdir=terraform/ apply -auto-approve -var="ssh_public_key=$(cat $HZ_SSH_KEY)"
