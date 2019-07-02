# /bin/sh

echo "Start dotfiles install.\n"

echo "Homebrew existence check."
type brew
if [ $? != 0 ]; then
    echo "Install Homebrew.\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Ansible existence check."
type ansible
if [ $? != 0 ]; then
    echo "Install ansible.\n"
    /usr/local/bin/brew install ansible
fi

echo "Python3 existence check."
type python3
if [ $? != 0 ]; then
    echo "Install python3.\n"
    /usr/local/bin/brew install python3
fi

echo "Execute playbook.\n"
/usr/local/bin/ansible-playbook main.yml -i inventories/inventory

echo "\nInstall finished.\n"
