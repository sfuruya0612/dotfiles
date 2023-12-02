# dotfiles

[![Ansible lint](https://github.com/sfuruya0612/dotfiles/actions/workflows/lint.yml/badge.svg)](https://github.com/sfuruya0612/dotfiles/actions/workflows/lint.yml)

## Description

Setting macOS with Ansible.

## Settings

### Prepere

Install homebrew and run `/opt/homebrew/bin/brew install git`.

```bash
make init
```

### Install

```bash
make

# Install tmux plugins
# Launch tmux
tmux && tmux source ~/.tmux.conf
# <prefix> + I
```

Reboot your PC after install.
