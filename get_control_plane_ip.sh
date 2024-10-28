#!/bin/bash

terraform -chdir=terraform output --json | jq -r .control_plane_ip_addr.value
