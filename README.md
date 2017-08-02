### Ansible-CSF
An ansible playbook for managing CSF Firewall.

Currently supports:
- All configuration in "csf.conf" (main)
- Modification of all config files in /etc/csf/*

Additional Features:
- Error catching for csfpre via a custom script that checks the exit value for all scripts run.
- Error catching for csfpost via a custom script that checks the exit value for all scripts run.

Future support:
- Additional panels (cPanel/DirectAdmin)

Example Configuration: https://github.com/ALinuxNinja/ansible-csf/blob/master/host_vars.yml
