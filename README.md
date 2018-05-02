# Docker for Declare

Docker image with SWI-Prolog and UniWue's [Declare system](https://github.com/UniWue/Declare).

## Usage

Installation:

```sh
docker build -t declare .
```

You can open a shell by calling:

```sh
docker run -it declare
```

[SWI-Prolog](http://www.swi-prolog.org/) is automatically installed via [swivm](https://github.com/fnogatz/swivm) and can be used with the command `swipl`. The Declare system is located at `/root/Dislog` and can be started by calling:

```sh
root@declare:/# cd ~/Dislog
root@declare:~/DisLog# swipl -s sources/dislog
```
