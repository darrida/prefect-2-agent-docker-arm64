####################################################################
# BASE BUILD with asyncpg
FROM --platform=linux/arm64 arm64v8/python:3.10.6-bullseye as base
# RUN     apt-get update &&  apt-get upgrade -y --no-install-recommends

RUN     python3 -m venv venv
# This step takes a very long time, because it's building a wheel for asyncpg from scratch/source
# - there must not be an arm64 wheel readily available
RUN     ./venv/bin/python3 -m pip install --upgrade pip && ./venv/bin/pip3 install wheel
RUN     ./venv/bin/pip3 install asyncpg>=0.23 
###############################
# DON'T TOUCH ABOVE THIS LINE #
###############################

####################################################################
# MAIN PYTHON DEPENDENCIES
FROM --platform=linux/arm64 arm64v8/python:3.10.6-bullseye as build
COPY --from=base venv venv

RUN     ./venv/bin/pip3 install prefect==2.2.0