# /bin/sh

echo "\033[33mStart dotfiles install.\033[00m\n"

type brew > /dev/null
if [ $? != 0 ]; then
    echo "Install Homebrew."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "\033[32mHomebrew is already installed.\033[00m"
fi

type ansible > /dev/null
if [ $? != 0 ]; then
    echo "Install ansible."
    /usr/local/bin/brew install ansible
else
    echo "\033[32mAnsible is already installed.\033[00m"
fi

type python3 > /dev/null
if [ $? != 0 ]; then
    echo "Install python3."
    /usr/local/bin/brew install python3
else
    echo "\033[32mPython3 is already installed.\033[00m\n"
fi

echo "Execute Ansible playbook.\nEnter sudo password."
/usr/local/bin/ansible-playbook main.yml \
    -i inventory/local \
    --ask-become-pass

echo "\033[33mInstall finished.\033[00m\n"
