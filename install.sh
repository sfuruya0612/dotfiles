# /bin/sh

echo "\033[33mStart dotfiles install.\033[00m\n"

echo "Execute Ansible playbook.\nEnter sudo password."
/usr/local/bin/ansible-playbook main.yml \
    -i inventory/local \
    --ask-become-pass

echo "\033[33mInstall finished.\033[00m\n"
