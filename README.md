# tdlib-telegram-bot-api-docker

## Purpose of the project
Produce working, minimal Docker image for the Telegram Bot API server together with easy
to use pipeline generating builds on the changes within the main repository managed by
Telegram team.

This project does not modify any part of the [tdlib/telegram-bot-api](https://github.com/tdlib/telegram-bot-api) code.

## Build schedule
Build will be triggered automatically once a week to produce the latest version of the Telegram API Server.
I would set it for the daily release but every build takes ~25 minutes and generates additional costs on my side.
Images are versioned in format `1.0.x` where `x` is a build number.

## How to use the image

Images created within this project support following architectures: AMD64 and ARM64

Yes, it means you can run them on *Raspberry Pi 4* and above as well! 🥳

### Github authentication
You need to authenticate with github ([see this thread](https://github.community/t/docker-pull-from-public-github-package-registry-fail-with-no-basic-auth-credentials-error/16358/87)) to pull even the publicly available images. To do so you need to create [Personal Access Token](https://github.com/settings/tokens/new) with `read:packages` scope and use it to authenticate your docker client with the Github Docker Registry.

```
docker login -u $GITHUB_USERNAME -p $GITHUB_TOKEN docker.pkg.github.com
```

### Docker configuration version

```
docker pull docker.pkg.github.com/lukaszraczylo/tdlib-telegram-bot-api-docker/telegram-api-server:latest
docker run -p 8081:8081 -e TELEGRAM_API_ID=yourApiID -e TELEGRAM_API_HASH=yourApiHash -t docker.pkg.github.com/lukaszraczylo/tdlib-telegram-bot-api-docker/telegram-api-server
```

*Thing to remember:* Entrypoint is set to the server binary, therefore you can still modify parameters on the go, as shown below

#### Setting the log output and verbosity
![Set the log output and verbosity](img/screen-001.png?raw=true)

#### Printing out the help
![Print out the help](img/screen-002.png?raw=true)

### Kubernetes configuration version

TBC;
