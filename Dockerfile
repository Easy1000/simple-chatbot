FROM rasa/rasa:latest

WORKDIR /app

COPY . /app

USER root

RUN rasa train

EXPOSE 5005

CMD [ "run" ]
