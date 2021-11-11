FROM python:3.7-buster

WORKDIR /code

RUN apt-get update \
    && python -m pip install ansible \
    && wget -O /usr/bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py \
    && chmod +x /usr/bin/systemctl

COPY server ./server
COPY ansible ./ansible
RUN ansible-playbook ansible/setup.yaml

CMD ["/usr/bin/systemctl", "init", "django", "postgresql@11-main"]

# django
EXPOSE 5000

# postgre
EXPOSE 5432