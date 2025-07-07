FROM ubuntu:22.04

# Обновление системы и установка необходимых пакетов
RUN apt update && \
    apt install -y openssh-server sudo cron nginx && \
    mkdir -p /run/sshd

# Настройка root-пользователя
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Удаление дефолтного сайта Nginx
RUN rm -f /etc/nginx/sites-enabled/default

# Открытие портов
EXPOSE 22
EXPOSE 80

# Команда по умолчанию — запуск SSH-демона
CMD ["/usr/sbin/sshd", "-D"]
