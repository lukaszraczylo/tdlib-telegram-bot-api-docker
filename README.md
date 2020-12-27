# tdlib-telegram-bot-api-docker

## Purpose of the project
Produce working, minimal Docker image for the Telegram Bot API server together with easy
to use pipeline generating builds on the changes within the main repository managed by
Telegram team.

## How to use the image

### Docker version

```
docker pull docker.pkg.github.com/lukaszraczylo/tdlib-telegram-bot-api-docker/telegram-api-server:latest
docker run -p 8081:8081 -e TELEGRAM_API_ID=yourApiID -e TELEGRAM_API_HASH=yourApiHash -t docker.pkg.github.com/lukaszraczylo/tdlib-telegram-bot-api-docker/telegram-api-server
```

### Kubernetes version

TBC;

## TODO

- Provide shorter link for the pulls. Honestly.