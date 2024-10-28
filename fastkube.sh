#!/bin/bash

set -e

sh ./create_infra.sh
sh ./set_inventory.sh
sh ./install_k8s.sh
sh ./install_cilium.sh
sh ./checkhealth.sh
