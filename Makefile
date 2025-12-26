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
		-i inventory/local \
		--ask-become-pass

	@echo "\033[33mDone\033[00m\n"

# e.g. ROLE=shell make install.role
install.role:
	@echo "\033[32mInstall dotfiles\033[0m"
	@echo ""
	@echo "\033[32mExecute ansible playbook\033[0m"
	@echo "\033[32mTarget role: ${ROLE}\033[0m"

	PATH="$$PATH:/opt/homebrew/bin/" \
	/opt/homebrew/bin/ansible-playbook main.yml \
		-i inventory/local \
		--ask-become-pass \
		--tags ${ROLE}

	@echo "\033[33mDone\033[00m\n"

lint:
	ansible-lint -c .ansible-lint main.yml
