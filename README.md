[![Ansible CI Pipeline](https://github.com/dmplastun/ansible-docker-lab/actions/workflows/ansible-ci.yml/badge.svg)](https://github.com/dmplastun/ansible-docker-lab/actions/workflows/ansible-ci.yml)

## 🛠️ Infrastructure Governance & Automated Provisioning Engine (Ansible & Docker)

This repository demonstrates server configuration automation using Ansible with Docker containers as managed hosts.
​
## 🎯 Project Goals

Learn to use Ansible for automation:
```
Software installation
User configuration
Cron job management across 9 Ubuntu servers running in Docker.​
```
---

## 📦 Project Contents
```   
Dockerfile — Ubuntu image with SSH/Nginx/cron
hosts.yml — Ansible inventory file
ansible.cfg — Ansible configuration
Makefile — Commands to run playbooks
playbooks/ — Playbooks directory:
deploy-nginx.yml — Nginx deployment via role
roles/ — Ansible roles structure (e.g., nginx)
README.md — Project documentation​
```
---

##🚀 How to Run
### 1. Build Docker Image

```
docker build -t ubuntu-sshd .
```

### 2. Start 9 Containers
```
for i in {1..9}; do
  docker run -d --name server$i -p 22$i:22 -p 80$i:80 ubuntu-sshd
done
```
### 3. Configure SSH Access
```
ssh-keygen -t rsa -b 4096
for i in {1..9}; do
  ssh-copy-id -i ~/.ssh/id_rsa.pub root@localhost -p 22$i
done
```
#### If key verification errors occur:
```
for i in {1..9}; do
  ssh-keygen -R '[localhost]:22'$i
done
```
### 4. Test Ansible Connectivity
```
make ping
```
### 📝 Makefile Commands
```
make ping            #Проверка доступности всех хостов
make deploy-nginx    #Развертывание Nginx через роль
make check-syntax    #Проверка синтаксиса плейбуков
make help            #Список доступных команд
```
### 🔐 Security
```
Uses SSH key authentication

Root password set to password (test environment only)

Use ansible-vault for secrets in production
```
​
### 📌 Author

👤 dmplastun
📧 dmitrij.plastun@gmail.com
🔗
https://github.com/dmplastun/ansible-docker-lab
​
```
