#!/bin/bash

CONTROL_PLANE_IP=$(terraform -chdir=./terraform/ output --json | jq -r .control_plane_ip_addr.value)
WORKER1_PLANE_IP=$(terraform -chdir=./terraform/ output --json | jq -r .worker1_ip_addr.value)

cat > ansible/inventory.ini <<EOF
[control_plane]
$CONTROL_PLANE_IP

[workers]
$WORKER1_PLANE_IP
EOF

