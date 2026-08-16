# dotfiles

[![Ansible lint](https://github.com/sfuruya0612/dotfiles/actions/workflows/lint.yml/badge.svg)](https://github.com/sfuruya0612/dotfiles/actions/workflows/lint.yml)

## Description

Setting macOS with Ansible.

## Settings

### Prepare

Install homebrew and run `/opt/homebrew/bin/brew install git`.

```bash
make init
```

Create `~/.gitconfig.local` with your git identity (not managed by this repository):

```ini
[user]
	name = <your name>
	email = <your email>
```

### Install

```bash
make
```

Install a single role:

```bash
ROLE=shell make install.role
```

### Upgrade homebrew packages

Package upgrades are separated from the install tasks because they are not idempotent.

```bash
make upgrade
```

## Lint

```bash
make lint
```
