# Переменные
PLAYBOOKS_DIR = playbooks
ANSIBLE_CFG = ansible.cfg
INVENTORY = hosts.yml

# Цели
all: ping

ping:
	ansible all -m ping

install:
	ansible-galaxy role install geerlingguy.docker

lint:
	ansible-lint $(PLAYBOOKS_DIR)/*.yml

test-connection:
	ansible all -m ping

check-syntax:
	ansible-playbook --syntax-check $(PLAYBOOKS_DIR)/*.yml

deploy-nginx:
	ansible-playbook $(PLAYBOOKS_DIR)/deploy-nginx.yml
clean:
	docker stop $(shell docker ps -aq);
	docker rm $(shell docker ps -aq)

help:
	@echo "Доступные команды:"
	@echo "  make ping               — Проверить подключение"
	@echo "  make deploy-nginx       — Запустить Nginx"
	@echo "  make check-syntax       — Проверить синтаксис"
	@echo "  make clean              — Очистить контейнеры"

.PHONY: all ping lint test-connection check-syntax help
