#!/usr/bin/env bash
###############################################################################
# csfpost.sh
# Managed by Ansible, do not manually edit. Your changes will be lost.
# Playbook: csf
# Author: ALinuxNinja
# URL: https://github.com/ALinuxNinja/ansible-csf
###############################################################################
set -e
# Set traps to catch errors (prevents /etc/csf/status/csfpost from being created)
trap 'echo "csfpost.sh failed";exit $?' 1 2 3 13 15

## Delete status file if it exists
if [ -f /etc/csf/status/csfpost ]; then
        rm /etc/csf/status/csfpost
fi

## Run files in alphabetical order
echo "Running csfpost rules"
for file in $(ls -1 /etc/csf/csfpost.d/ | sort -V); do
	chmod u+x /etc/csf/csfpost.d/${file}
	/etc/csf/csfpost.d/${file}
done

## Indicate that everything is successfull
touch /etc/csf/status/csfpost
