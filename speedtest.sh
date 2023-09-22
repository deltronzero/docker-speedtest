#!/bin/sh

docker build -q -t speedtest:latest . && docker run -it --rm speedtest:latest $@
