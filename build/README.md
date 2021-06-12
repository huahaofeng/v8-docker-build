# DESCRIPTION
docker image which runs v8 build scripts 

# DOCKER HUB
```sh
$ sudo docker pull nikola1234/v8:build
```

# BUILD STEPS
```sh
$ sudo docker build -t nikola1234/v8:build -f Dockerfile.build .
```

# USAGE

## 1. build v8

Similar to https://v8.dev/docs/build-gn#compile

To build all of V8, run:
```sh
$ docker run -it --rm \
          -v $PWD/target:/home/repo/v8/out/target \
          -e SOURCE_TAG=9.0.257.29 \
          -e SYNC=true \
          nikola1234/v8:build build
```

To build specific targets like d8, append them to the command:
```sh
$ docker run -it --rm \
          -v $PWD/target:/home/repo/v8/out/target \
          -e SOURCE_TAG=9.0.257.29 \
          -e SYNC=true \
          nikola1234/v8:build build d8
```

build target objects are located in `target` of current directory 

### env supported
* **SOURCE_TAG** - string, v8 version, default `9.0.257.29`
* **SYNC** - string, set "true" to `gclient sync`, default `false`
* **GN_ARGS** - string, args for `gn gen`, default `v8_monolithic=true v8_use_external_startup_data=false is_component_build=false is_debug=false target_cpu="x64" use_goma=false goma_dir="None" v8_enable_backtrace=true v8_enable_disassembler=true v8_enable_object_print=true v8_enable_verify_heap=true`

or if you want to use a proxy in docker container
```sh
$ docker run -it --rm \
          -v $PWD/target:/home/repo/v8/out/target \
          -e SOURCE_TAG=9.0.257.29 \
          -e SYNC=true \
          --net=host \
          -e http_proxy=http://127.0.0.1:7890 \
          -e https_proxy=http://127.0.0.1:7890 \
          nikola1234/v8:build build d8
```

## 2. bash
open bash for more complicated operation
```sh
$ docker run -it --rm \
          -v $PWD/target:/home/repo/v8/out/target \
          -e SOURCE_TAG=9.0.257.29 \
          nikola1234/v8:build bash
```

## 3. other cmd
```sh
$ docker run -it --rm \
          -v $PWD/target:/home/repo/v8/out/target \
          -e SOURCE_TAG=9.0.257.29 \
          nikola1234/v8:build tools/run-tests.py --outdir out/target
```