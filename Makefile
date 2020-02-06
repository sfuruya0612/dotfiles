install:
	sh install.sh

test:
	ansible-lint -c .ansible-lint main.yml
