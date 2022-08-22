FROM    prefecthq/prefect:2.1.1-python3.10

RUN     apt-get update && apt-get upgrade -y
RUN     curl -fsSL https://get.docker.com | sh

ADD     ./startup.sh startup.sh
ADD     ./work_queues_list.py work_queues_list.py
RUN     chmod +x startup.sh

ENTRYPOINT ["bash", "startup.sh"]