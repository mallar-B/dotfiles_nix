#!/bin/bash

nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager

wait

sudo nix-channel --update

wait

nix-shell '<home-manager>' -A install
