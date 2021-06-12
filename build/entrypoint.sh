#!/bin/bash
set -e

cd /home/repo/v8
echo -e "git checkout ${SOURCE_TAG}"
git checkout ${SOURCE_TAG}

# 有外网环境情况下可打开此项
if [ "${SYNC}" = 'true' ]; then
  echo -e "gclient sync..."
  gclient sync
fi

if [ "$1" = 'bash' ]; then
  echo -e "start bash"
  exec bash
elif [ "$1" = 'build' ]; then
  echo -e "gen args ${GN_ARGS}"
  gn gen out/target --args="${GN_ARGS}"

  shift
  echo -e "ninja args $*"
  ninja -C out/target $*
else
  exec "$@"
fi