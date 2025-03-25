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
```

## Troubleshooting

### Downgrade Lua

If you have an lua newer than 5.1.5, you need to downgrade it.

```bash
wget https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar xvf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
sudo make install
lua -v
```
