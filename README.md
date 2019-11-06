# Dotfiles  
[![Build Status](https://travis-ci.org/sfuruya0612/dotfiles.svg?branch=master)](https://travis-ci.org/sfuruya0612/dotfiles)

## Description  
Building vim, tmux, zsh environment of macOS with Ansible.  
**<span style="color: red; ">Follow Terminal.app and Alacritty</span>**  

#### Supported Versions
| Tool | Version |
|:-----|:--------|
| Vim  | 8.1     |
| Tmux | 2.9a    |
| Zsh  | 5.7.1   |

*Supports MacOS version after mojave.*

## Install

#### Prepere
When using mackerel, add `API_KEY` to `group_vars/all.yml`

```sh
git clone https://github.com/sfuruya0612/dotfiles.git
cd ~/dotfiles
sh install.sh

# Restart Terminal.app or Alacritty
```

## Setting(Only use the Terminal.app)
1. Load dotfiles/schema/Solarized Dark.terminal file into Terminal.app and create a new Profile.
    - Terminal.app -> Preferences -> Profile -> Add profile

1. Set text tab based on image.
    - You can use the font as you like.  
<img src="https://github.com/sfuruya0612/dotfiles/blob/master/images/terminal_text.png" width="320px">

1. Check “Use Option key as meta key” on the keyboard tab.
