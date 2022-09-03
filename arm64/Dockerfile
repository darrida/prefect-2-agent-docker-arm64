####################################################################
# INSTALL SLIM-BUSTER UPGRADES
FROM    --platform=linux/arm64 arm64v8/python:3.10.6-slim-buster as buster_upgraded
RUN     apt-get update && apt-get upgrade -y --no-install-recommends

####################################################################
# BUILD PACKAGE WHEELS
FROM --platform=linux/arm64 arm64v8/python:3.10.6-buster as package_wheels
RUN   apt-get update && apt-get upgrade -y --no-install-recommends

WORKDIR /wheels
RUN pip3 install --upgrade pip
COPY requirements.txt .
RUN pip3 wheel -r requirements.txt

####################################################################
# INSTALL DEPENDENCIES
FROM    --platform=linux/arm64 buster_upgraded as build
COPY    --from=package_wheels /wheels /wheels

COPY    requirements.txt .
RUN     python3 -m venv venv
RUN     ./venv/bin/python3 -m pip install --upgrade pip && \
        ./venv/bin/pip3 install -r requirements.txt -f /wheels && \
        rm -rf wheels && \
        rm -rf /root/.cache/pip/*

####################################################################
# FINAL IMAGE
FROM    --platform=linux/arm64 buster_upgraded as final
RUN     apt-get update && apt-get install curl -y --no-install-recommends && \
        curl -fsSL https://get.docker.com | sh
COPY    --from=build venv venv

ADD     ./startup.sh startup.sh
ADD     ./work_queues_list.py work_queues_list.py
RUN     chmod +x startup.sh

CMD ["bash", "startup.sh"]