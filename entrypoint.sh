#!/bin/bash
set -e
 
printf "\n\033[0;44m---> Starting the SSH server!\033[0m\n"

service ssh start
service ssh status
# service fail2ban status
# sudo systemctl status fail2ban
exec "$@"