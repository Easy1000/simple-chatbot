FROM rasa/rasa:3.6.20

WORKDIR /app

COPY . /app

USER root

RUN rasa train

EXPOSE 5005

CMD [ "run" ]
