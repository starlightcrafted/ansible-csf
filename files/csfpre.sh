#!/usr/bin/env bash
###############################################################################
# csfpre.sh
# Managed by Ansible, do not manually edit. Your changes will be lost.
# Playbook: csf
# Author: ALinuxNinja
# URL: https://github.com/ALinuxNinja/ansible-csf
###############################################################################
set -e
# Set traps to catch errors (prevents /etc/csf/status/csfpre from being created)
trap 'echo "csfpre.sh failed";exit $?' 1 2 3 13 15

## Delete status file if it exists
if [ -f /etc/csf/status/csfpre ]; then
        rm /etc/csf/status/csfpre
fi

## Run files in alphabetical order
echo "Running csfpre rules"
for file in $(ls -1 /etc/csf/csfpre.d/ | sort -V); do
        /etc/csf/csfpre.d/${file}
done

## Indicate that everything is successfull
touch /etc/csf/status/csfpre
