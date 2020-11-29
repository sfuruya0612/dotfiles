# dotfiles

[![Build Status](https://travis-ci.org/sfuruya0612/dotfiles.svg?branch=master)](https://travis-ci.org/sfuruya0612/dotfiles)

## Description

Setting macOS with Ansible.

Supported for later OS than Catalina.

## Directory

```bash
.
├── Makefile
├── README.md
├── ansible.cfg
├── group_vars
│   └── all.yml
├── install.sh
├── inventory
│   └── local
├── main.yml
└── roles
    ├── alacritty
    ├── common
    ├── homebrew
    ├── mackerel
    ├── osx_defaults
    ├── shell
    ├── tmux
    └── vim
```

## Settings

### Prepere

If these are not installed, install them.

- Install homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install git, python3, ansible

```bash
/usr/local/bin/brew install git python3 ansible
```

- Install xcode command line tools

```bash
xcode-select --install
```

### Install

To change the Login Shell, change the `SHELL` parameter in `group_vars/all.yml` file.  
(Default fish shell)

```bash
cd ~ && git clone https://github.com/sfuruya0612/dotfiles.git && dotfiles && make
# Enter sudo password

# Install tmux plugins
# Launch tmux
tmux && tmux source ~/.tmux.conf
# <prefix> + I
```

Reboot your PC after install.
