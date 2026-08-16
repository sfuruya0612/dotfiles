all: install

init:
	@echo "\033[32mInstall python3, ansible\033[0m"
	/opt/homebrew/bin/brew install python3 ansible
	@echo "\033[32mInstall ansible galaxy\033[0m"
	/opt/homebrew/bin/ansible-galaxy collection install -r requirements.yml

install:
	@echo "\033[32mInstall dotfiles\033[0m"
	@echo ""
	@echo "\033[32mExecute ansible playbook\033[0m"

	PATH="$$PATH:/opt/homebrew/bin/" \
	/opt/homebrew/bin/ansible-playbook main.yml \
		-i inventory/local

	@echo "\033[33mDone\033[00m\n"

# e.g. ROLE=shell make install.role
install.role:
ifndef ROLE
	$(error ROLE is not set. Usage: ROLE=<role> make install.role)
endif
	@echo "\033[32mInstall dotfiles\033[0m"
	@echo ""
	@echo "\033[32mExecute ansible playbook\033[0m"
	@echo "\033[32mTarget role: ${ROLE}\033[0m"

	PATH="$$PATH:/opt/homebrew/bin/" \
	/opt/homebrew/bin/ansible-playbook main.yml \
		-i inventory/local \
		--tags ${ROLE}

	@echo "\033[33mDone\033[00m\n"

upgrade:
	@echo "\033[32mUpgrade homebrew packages\033[0m"

	PATH="$$PATH:/opt/homebrew/bin/" \
	/opt/homebrew/bin/ansible-playbook main.yml \
		-i inventory/local \
		--tags upgrade

	@echo "\033[33mDone\033[00m\n"

lint:
	PATH="$$PATH:/opt/homebrew/bin/" \
	ansible-lint -c .ansible-lint main.yml
