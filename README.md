# dotfiles

[![Build Status](https://travis-ci.org/sfuruya0612/dotfiles.svg?branch=master)](https://travis-ci.org/sfuruya0612/dotfiles)

## Description

Building neovim, tmux, zsh environment of macOS with Ansible.  
*Supports MacOS version after mojave.*  

## Settings

### Prepere

- Install homebrew when not installed.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install git, python3, ansible.

```bash
/usr/local/bin/brew install git python3 ansible
```

### Install

When using mackerel, add `MACKEREL_API_KEY` to `group_vars/all.yml`

```bash
cd ~; git clone https://github.com/sfuruya0612/dotfiles.git; cd dotfile
make

# Restart your Terminal or Start Alacritty
```
