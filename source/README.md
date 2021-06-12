# DESCRIPTION
docker image which contains v8 repo and depot_tools 

# DOCKER HUB
```sh
$ sudo docker pull nikola1234/v8:source
```

# BUILD STEPS
## 1. Preparing
### clone depot_tools

* https://v8.dev/docs/source-code
* https://chromium.googlesource.com/chromium/tools/depot_tools.git

```sh
$ git clone https://chromium.googlesource.com/chromium/tools/depot_tools
$ chmod +x depot_tools/*
```

### clone v8

```sh
$ cd repo
$ fetch v8
```

## 2. Build

```sh
$  sudo docker build -t nikola1234/v8:source -f Dockerfile.source .
```