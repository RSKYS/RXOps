.PHONY: all

all: setup run

setup:
	@git submodule update --init --recursive
	@cd Roles && for dir in */; do \
		cd "$$dir" && ansible-galaxy install -r tests/requirements.yml; \
		cd ..; \
	done

run:
	ansible-playbook -i inv.ini play.yml --ask-vault-pass
