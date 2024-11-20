# Chatbot

Chatbot for certain use using [Rasa](https://rasa.com/docs/rasa/)

## Prerequisites

Make sure have these installed:

- docker
- docker compose

This chatbot is setup with docker, following this [documentation](https://rasa.com/docs/rasa/docker/building-in-docker/#training-a-model)

## Setup project

```bash
git clone [this repo]
```

## Run this service

```bash
docker compose up -d
```

This will create the docker container and train a new model inside the container

## Train a new model and interact with it

Train new model:

```bash
docker run -it -u root --rm -v $(pwd):/app -w /app rasa/rasa train --domain domain.yml --data data --out models
```

Interact with newest model in the shell:

```bash
docker run -it -u root --rm -v $(pwd):/app -w /app rasa/rasa shell
```

## Development

Follow the [docs](https://rasa.com/docs/rasa/) by Rasa to implement new features to this chatbot

## API

API for this chatbot is at `http://localhost:5005/webhooks/rest/webhook`

Example of POST request:

```bash
curl -XPOST http://localhost:5005/webhooks/rest/webhook \
  -H "Content-type: application/json" \
  -d '{"sender": "test", "message": "hello"}'
```
