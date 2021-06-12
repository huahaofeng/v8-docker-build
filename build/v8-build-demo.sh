#!/bin/bash
docker run -it --rm \
        -v $PWD/target:/home/repo/v8/out/target \
        -e SOURCE_TAG=9.0.257.29 \
        -e SYNC=true \
        --net=host \
        -e http_proxy=http://127.0.0.1:7890 \
        -e https_proxy=http://127.0.0.1:7890 \
        nikola1234/v8:build build d8
