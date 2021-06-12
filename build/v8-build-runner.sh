#!/bin/bash
docker run -it --rm \
        -v $PWD/target:/home/repo/v8/out/target \
        nikola1234/v8:build $*
