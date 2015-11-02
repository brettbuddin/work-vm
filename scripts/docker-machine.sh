#!/usr/bin/env bash

docker-machine create \
    --driver generic \
    --generic-ssh-user vagrant \
    --generic-ssh-key .vagrant/machines/default/virtualbox/private_key \
    --generic-ip-address 10.10.10.23 \
    work 

eval "$(docker-machine env work)"
