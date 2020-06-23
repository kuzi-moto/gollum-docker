# Gollum Docker

This is a lightweight Docker image for the  [Gollum](https://github.com/gollum/gollum) wiki software. It's based of the [ruby:alpine3.12](https://hub.docker.com/_/ruby/) image. Using a multi-stage build, at the time of writing is the smallest image for Gollum.

## Usage

### Acquire

#### Build

If you wish to make modifications, you can clone this repository, then build using:

```bash
docker build -t kuzimoto/gollum-docker .
```

#### Image

An image on Docker Hub is available, just pull:

```bash
docker pull kuzimoto/gollum-docker
```

### Run

The quickest way to use would be to use Docker run:

```bash
docker run --rm -p 80:80 -v wiki:/wiki
```

The recommended way is to use a Docker Compose file, which allows you to easily save your startup options. Make sure to enter a valid path in the **volumes** section. You can use an existing git repository, or create a new directory.

**Important**: If the directory you mount does not already have a git repository inside, make sure to run `git init` first, otherwise Gollum will not work properly.

`docker-compose.yml`:

```YAML
version: '3'

services:
  gollum:
    image: kuzimoto/gollum-docker
    container_name: gollum
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    volumes:
      - /path/to/wiki:/wiki
```

Execute the following to start the Gollum container in the background:

```BASH
docker-compose up -d
```
