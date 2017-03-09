# Docker scratch image

Minimum viable Docker image(428 bytes compressed).

Allows you to distribute your code in a slim docker image artifact, separate from the execution environment.

# Why?

It's convenient in case you package your software into minimalistic data-images, that don't actually being run, but 
instead expose their content via `volumes_from` (after the container is created from it). This way you can version your software independently from 3rd party dependencies.

The only difference from the Docker Hub's native `scratch` image is addition of an empty (<1kb) linux binary that always returns `0` (`/bin/true`). 
It is set as image's entrypoint, so it's always safe to run the resulted image and to create container out of it. Without explicitly defining a command or entrypoint.

# Usage

Use it just as you would use the native scratch image. 

Consider the following usage snippets:

### Dockerfile
```
FROM    umkus/scratch
COPY    . /var/www/
VOLUME  /var/www/
```

### Building

```bash
$ docker build -t repo/app --squash .
```
### Docker compose

```yaml
version: '2'
services:
    fpm:
        image: php
        volumes_from:
            - code
        entrypoint: php bin/console -vvv
    code:
        image: repo/app
```
