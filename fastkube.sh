#!/bin/bash

sh ./create_infra.sh
sh ./set_inventory.sh
sh ./install_k8s.sh
sh ./checkhealth.sh
