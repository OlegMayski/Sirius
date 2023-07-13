FROM registry.s.rosatom.education/sirius/docker/ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 python3-pip python3-setuptools && \
    rm -rf /var/cache/apt/archives/*

ADD ./app/requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

COPY ./app /app/

EXPOSE 80

WORKDIR /app

CMD [ "flask", "run", "--host=0.0.0.0", "--port=80" ]

