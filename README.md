[![Ansible CI Pipeline](https://github.com/dmplastun/ansible-docker-lab/actions/workflows/ansible-ci.yml/badge.svg)](https://github.com/dmplastun/ansible-docker-lab/actions/workflows/ansible-ci.yml)

# 🛠️ Ansible + Docker Лабораторный Проект

Этот репозиторий содержит пример автоматизации настройки серверов через **Ansible** с использованием **Docker-контейнеров** как управляемых хостов.

## 🎯 Цель проекта

Научиться использовать Ansible для автоматизации:
- Установки ПО
- Настройки пользователей
- Управления cron-заданиями
на 9 Ubuntu-серверах, развернутых в Docker.

---

## 📦 Что включает проект

- `Dockerfile` — образ Ubuntu с SSH/Nginx/cron
- `hosts.yml` — файл инвентаризации для Ansible
- `ansible.cfg` — конфигурация Ansible
- `Makefile` — удобные команды для запуска плейбуков
- `playbooks/` — каталог с плейбуками:
  - `deploy-nginx.yml` — развертывание Nginx через роль
- `roles/` — структура ролей Ansible (например, `nginx`)
- `README.md` — документация проекта

---

## 🚀 Как запустить проект

### 1. Сборка образа Docker

```bash
docker build -t ubuntu-sshd .
```

### 2. Запуск 9 контейнеров
```
for i in {1..9}; do
  docker run -d --name server$i -p 22$i:22 -p 80$i:80 ubuntu-sshd
done
```
### 3. Настройка SSH-доступа
```
ssh-keygen -t rsa -b 4096
for i in {1..9}; do
  ssh-copy-id -i ~/.ssh/id_rsa.pub root@localhost -p 22$i
done
```
#### Если возникают ошибки проверки ключей
```
for i in {1..9}; do
  ssh-keygen -R '[localhost]:22'$i
done
```
### 4. Проверка подключение через Ansible
```
make ping
```
### 📝 Дополнительные команды из Makefile
```
make ping            #Проверка доступности всех хостов
make deploy-nginx    #Развертывание Nginx через роль
make check-syntax    #Проверка синтаксиса плейбуков
make help            #Список доступных команд
```
### 🔐 Безопасность
    Используется SSH-авторизация по ключам
    Пароль root задан как password (только для тестовой среды)
    Рекомендуется использовать ansible-vault для управления секретами в production
### 📌 Автор
```
👤 dmplastun
📧 dmitrij.plastun@gmail.com
🔗 https://github.com/dmplastun/ansible-docker-lab/
```
