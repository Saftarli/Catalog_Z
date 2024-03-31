FROM python:3.10-slim

RUN apt update

RUN apt install python3-dev build-essential -y

RUN pip3 install --upgrade pip

ENV PYTHONDONTWRITEBYCODE 1
ENV VIRTUAL_ENV=/opt/venv

RUN apt-get update && apt-get install -y python3-pip

RUN pip3 install virtualenv && python3 -m virtualenv $VIRTUAL_ENV

ENV PAtH='$VIRTUAL_ENV/bin:$PAtH'

ADD ./requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

COPY . /srv/app

WORKDIR /srv/app


