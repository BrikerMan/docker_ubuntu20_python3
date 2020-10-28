FROM ubuntu:20.04

ARG DEBIAN_FRONTEND="noninteractive"

# set the variables as per $(pyenv init -)
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL="C.UTF-8" \
    PATH="/opt/pyenv/shims:/opt/pyenv/bin:$PATH" \
    PYENV_ROOT="/opt/pyenv" \
    PYENV_SHELL="bash"

USER root
WORKDIR /code

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
    gcc \
    g++ \
    zlibc \
    zlib1g-dev \
    libssl-dev \
    libbz2-dev \
    libsqlite3-dev \
    libncurses5-dev \
    libgdbm-dev \
    libgdbm-compat-dev \
    liblzma-dev \
    libreadline-dev \
    uuid-dev \
    libffi-dev \
    tk-dev \
    wget \
    gawk \
    curl \
    git \
    make \
    sudo \
    bash-completion \
    tree \
    vim \
    software-properties-common && \
    mv /usr/bin/lsb_release /usr/bin/lsb_release.bak && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/*

ARG PYTHON_VERSION="3.8.6"
RUN curl https://pyenv.run | bash

RUN pyenv update \
    && pyenv install $PYTHON_VERSION \
    && pyenv virtualenv $PYTHON_VERSION general \
    && pyenv global general

CMD [ "/bin/bash" ]
