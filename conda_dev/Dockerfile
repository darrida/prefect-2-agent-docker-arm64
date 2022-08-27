# FROM --platform=linux/arm64 prefecthq/prefect:2.1.1-python3.10
FROM --platform=linux/arm64 arm64v8/python:3.10.6-bullseye as build
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

# RUN     apt-get update && apt-get upgrade -y
# RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# RUN     curl -fsSL https://get.docker.com | sh

RUN set -x && \
    # apt-get update && apt-get install -y curl bzip2 && \
    curl -s -L https://repo.continuum.io/miniconda/Miniconda-latest-Linux-armv7l.sh > miniconda.sh && \
    yes | bash miniconda.sh -b -p  /opt/conda &&  \
    rm miniconda.sh && \
    export PATH=/opt/conda/bin:$PATH && \
    conda config --set show_channel_urls True && \
    conda update --all --yes
RUN conda --version

ADD ./environment.yaml environment.yaml
RUN conda create --name prefect-2-agent --file ./environment.yaml --prefix ./env


FROM --platform=linux/arm64 arm64v8/python:3.10.6-slim-bullseye as application
COPY --from=build env env

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

ADD     ./startup.sh startup.sh
ADD     ./work_queues_list.py work_queues_list.py
RUN     chmod +x startup.sh

ENTRYPOINT ["bash", "startup.sh"]