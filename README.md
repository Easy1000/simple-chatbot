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
docker run -it -u root --rm -v $(pwd):/app -w /app rasa/rasa:3.6.20 train --domain domain.yml --data data --out models
```

Interact with newest model in the shell:

```bash
docker run -it -u root --rm -v $(pwd):/app -w /app rasa/rasa:3.6.20 shell
```

## Development

Follow the [docs](https://rasa.com/docs/rasa/) by Rasa to implement new features to this chatbot

## Current Available Intents

- inquire service pricing
- request profile background
- request link resources
- recommend services
- confirm meeting
- schedule meeting
- request work samples

Available in [domain.yml](./domain.yml) and [nlu.yml](./data/nlu.yml)

## API

API for this chatbot is at `http://localhost:5005/webhooks/rest/webhook`

Example of POST request:

```bash
curl -XPOST http://localhost:5005/webhooks/rest/webhook \
  -H "Content-type: application/json" \
  -d '{"sender": "test", "message": "hello"}'
```

JSON payload details:

- sender: is the sender id, used by Rasa to keep tract multiple conversations (**IMPORTANT**: sender field will be used as sender id/session id for Rasa to keep track of conversation, preferrably act as identification of customer and the user/freelancer)
- message: message sent by user in the chat room, used to trigger certain action
