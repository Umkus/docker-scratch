# Docker scratch image

Minimum viable Docker scratch image. 

It's convenient in case you package your software into a minimalistic data-images, that don't actually being run, but 
instead have their content referred via `volumes_from`.

The only difference from the Docker Hub's native `scratch` image is addition of an empty (>1kb) binary that always returns `0`.
It's set as image's entrypoint, so it's alwasy safe to run the resulted image.

This allows you to distribute your code in a slim docker image artifact separate from the execution environment.

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
