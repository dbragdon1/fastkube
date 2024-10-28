#!/bin/bash

KUBECONFIG=./kubeconfig 

cilium install
cilium status --wait
