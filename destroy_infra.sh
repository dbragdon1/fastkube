#!/bin/bash

terraform -chdir=terraform/ destroy -var="ssh_public_key=$(cat $HZ_SSH_KEY)"
