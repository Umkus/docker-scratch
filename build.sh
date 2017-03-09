#!/usr/bin/env bash

docker run --rm -v `pwd`:/usr/src -w /usr/src gcc gcc -w -static -Os -s -nostartfiles -fno-asynchronous-unwind-tables -o true true.c
docker run --rm -v `pwd`:/usr/src -w /usr/src gcc strip -s -R .comment -R .gnu.version --strip-unneeded ./true
docker build -t umkus/scratch --squash --no-cache .
