#!/bin/bash

cd /home/repo/v8
echo -e "git checkout ${SOURCE_TAG}"
git checkout ${SOURCE_TAG}

# 有外网环境情况下可打开此项
if [ "${SYNC}" = 'true' ]; then
        echo -e "gclient sync..."
        gclient sync
fi

echo -e "gen args ${GN_ARGS}"
gn gen out/target --args="${GN_ARGS}"

echo -e "ninja args $*"
ninja -C out/target $*
