#!/bin/bash
docker run -it --rm \
        -v $PWD/target:/home/repo/v8/out/target \
        -e SOURCE_TAG=9.0.257.29 \
        nikola1234/v8:build $*
