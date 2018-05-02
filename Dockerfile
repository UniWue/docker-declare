# Set the base image to ubuntu 18.04
FROM ubuntu:18.04

MAINTAINER Falco Nogatz "fnogatz@gmail.com"

# update apt index
RUN apt-get update

## preliminaries

RUN apt-get install -y \
    curl \
    git \
    wget \
    nano

## setup swipl

RUN apt-get install -y \
    swi-prolog-java \
    swi-prolog-x \
    swi-prolog-odbc

## setup swivm

# install required dependencies for swivm
RUN apt-get install -y \
    autoconf \
    make \
    libgmp-dev \
    libxt-dev \
    libjpeg-dev \
    libxpm-dev \
    libxft-dev \
    libdb-dev \
    libssl-dev \
    unixodbc-dev \
    libarchive-dev \
    uuid-dev \
    libedit-dev \
&& rm -rf /var/lib/apt/lists/*

# install swivm
RUN curl -o- https://raw.githubusercontent.com/fnogatz/swivm/v0.3.2/install.sh | bash

RUN /bin/bash -c "source ~/.swivm/swivm.sh; swivm install 6.6.6 && swivm alias default 6.6.6 && swivm use 6.6.6"

## setup Declare

RUN cd ~ \
&&  wget http://www1.informatik.uni-wuerzburg.de/database/DisLog/DisLog.tgz \
&&  tar -zxvf DisLog.tgz \
&&  rm DisLog.tgz \
&&  mv DisLog Dislog
