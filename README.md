# Docker scratch image

Minimum viable Docker image.

Allows you to distribute your code in a slim docker image artifact, separate from the execution environment.

# Why?

It's convenient in case you package your software into minimalistic data-images, that don't actually being run, but 
instead have their content referred to via `volumes_from` (after the container is created out of it).

The only difference from the Docker Hub's native `scratch` image is addition of an empty (>1kb) linux binary that always returns `0`.
It is set as image's entrypoint, so it's alwasy safe to run the resulted image and to create container out of it.

# Usage

Use it just as you would use the native scratch image. 

Consider the following examples:

### Dockerfile
```
FROM    umkus/scratch
COPY    . /var/www/
VOLUME  /var/www/
```

### Building

```bash
docker build -t repo/image --squash .
```
### Docker compose

```yaml
version: '2'
services:
    service:
        image: php
        volumes_from:
            - code
        entrypoint: php bin/console -vvv

    code:
        image: repo/image
```
