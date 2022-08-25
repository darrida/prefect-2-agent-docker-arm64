# FROM --platform=linux/arm64 prefecthq/prefect:2.1.1-python3.10
FROM --platform=linux/arm64 arm64v8/python:3.10.6-bullseye as build

RUN     apt-get update && apt-get upgrade -y --no-install-recommends && \
        curl -fsSL https://get.docker.com | sh

RUN     python3 -m venv venv
RUN     ./venv/bin/python3 -m pip install --upgrade pip && ./venv/bin/python3 -m pip install wheel prefect==2.1.1



FROM --platform=linux/arm64 arm64v8/python:3.10.6-slim-bullseye as application
COPY --from=build venv venv

ADD     ./startup.sh startup.sh
ADD     ./work_queues_list.py work_queues_list.py
RUN     chmod +x startup.sh

ENTRYPOINT ["bash", "startup.sh"]