#!/usr/bin/env bash
docker run --rm -v `pwd`:/usr/src -w /usr/src gcc gcc -static -Os -s -nostartfiles -fno-asynchronous-unwind-tables -o true true.c
docker run --rm -v `pwd`:/usr/src -w /usr/src gcc strip -R .comment -s ./true
docker build -t umkus/scratch --squash .
docker run --rm umkus/scratch
