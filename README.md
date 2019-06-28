# Dotfiles  


## Supported Versions
| Tool | Version |
|:-----|:--------|
| Vim  | 8.1     |
| Tmux | 2.9a    |
| Zsh  | 5.7.1   |


## Description  
Setting of zsh, vim, tmux for macOS(Used Terminal.app)  


## Setting dotfiles  
```sh
git clone https://github.com/sfuruya0612/dotfiles.git
cd ~/dotfiles
sh install.sh

# if necessary
source ~/.vimrc
source ~/.tmux.conf
source ~/.zprofile
source ~/.zshrc
```

## Install dotfiles
``` sh
ansible-playbook main.yml -i inventories/inventory
```
