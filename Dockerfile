FROM registry.s.rosatom.education/sirius/docker/python:3.11-alpine

ARG USER=app
ARG ID=2000

RUN addgroup -g ${ID} ${USER} && \
    adduser -D -H -G ${USER} -u ${ID} -h /nonexistent -s /sbin/nologin ${USER}

ADD ./app/requirements.txt /requirements.txt

RUN pip3 install -r /requirements.txt

COPY ./app /app/

EXPOSE 80

WORKDIR /app

USER ${USER}

CMD [ "flask", "run", "--host=0.0.0.0", "--port=80" ]

