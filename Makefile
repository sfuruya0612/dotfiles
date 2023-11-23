all: install

init:
	@echo "\033[32mInstall homebrew\033[0m"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@echo "\033[32mInstall git, python3, ansible\033[0m"
	/usr/local/bin/brew install git python3 ansible
	@echo "\033[32mInstall command line tool\033[0m"
	xcode-select --install
	@echo "\033[32mInstall ansible galaxy\033[0m"
	ansible-galaxy collection install -r requirements.yml

install:
	@echo "\033[32mInstall dotfiles\033[0m"
	@echo ""
	@echo "\033[32mExecute ansible playbook\033[0m"

	ansible-playbook main.yml \
		-i inventory/local \
		--ask-become-pass \
		-v

	@echo "\033[33mDone\033[00m\n"

# e.g. ROLE=shell make install.role
install.role:
	@echo "\033[32mInstall dotfiles\033[0m"
	@echo ""
	@echo "\033[32mExecute ansible playbook\033[0m"
	@echo "\033[32mTarget role: ${ROLE}\033[0m"

	ansible-playbook main.yml \
		-i inventory/local \
		--tags ${ROLE} \
		-v

	@echo "\033[33mDone\033[00m\n"

test:
	ansible-lint -c .ansible-lint main.yml
