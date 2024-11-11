FROM rasa/rasa:latest

WORKDIR /app

COPY . /app

USER root

RUN rasa train

CMD [ "rasa", "run" ]
