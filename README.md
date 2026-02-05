# grigiu/adminer

[Adminer](https://www.adminer.org/) is a full-featured database management tool for the web. It is a lightweight alternative to phpMyAdmin.

This repository provides a Docker image based on Debian Bookworm with **Adminer 5.4.1**.

![](http://www.adminer.org/static/designs/hever/screenshot.png)

## Build locale

```bash
docker build -t grigiu/adminer:5.4.1 .
```

## Avvio locale

```bash
docker run -d --name adminer -p 8080:80 grigiu/adminer:5.4.1
```

Oppure con Docker Compose:

```bash
docker compose up -d
```

Poi apri:

```text
http://localhost:8080
```

## Variabili ambiente

- `MEMORY` (default: `256M`)
- `UPLOAD` (default: `2048M`)

## Pipeline DevOps GitHub (build container)

La pipeline è definita in `.github/workflows/docker-publish.yml` e fa:

1. Build multi-arch (`linux/amd64`, `linux/arm64`) con Buildx.
2. Push automatico su **GHCR** (`ghcr.io/<owner>/<repo>`) su branch di default e tag `v*.*.*`.
3. Push opzionale su **Docker Hub** se configuri variabili/segreti.

### Configurazione richiesta per Docker Hub (opzionale)

Nel repository GitHub configura:

- **Repository Variable**
  - `DOCKERHUB_IMAGE` (es. `grigiu/adminer`)
- **Repository Secrets**
  - `DOCKERHUB_USERNAME`
  - `DOCKERHUB_TOKEN`

Se `DOCKERHUB_IMAGE` non è impostata, la pipeline pubblica solo su GHCR.
