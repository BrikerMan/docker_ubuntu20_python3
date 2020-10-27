FROM ubuntu:20.04

USER root
WORKDIR /root

SHELL [ "/bin/bash", "-c" ]

# Existing lsb_release causes issues with modern installations of Python3
# https://github.com/pypa/pip/issues/4924#issuecomment-435825490
# Set (temporarily) DEBIAN_FRONTEND to avoid interacting with tzdata
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

ARG PYTHON_VERSION=3.8.0
ARG LINK_PYTHON_TO_PYTHON3=1

COPY install_python.sh install_python.sh
RUN bash install_python.sh ${PYTHON_VERSION} ${LINK_PYTHON_TO_PYTHON3} && \
    rm -r install_python.sh Python-*

# Enable tab completion by uncommenting it from /etc/bash.bashrc
# The relevant lines are those below the phrase "enable bash completion in interactive shells"
RUN export SED_RANGE="$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+1)),$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+7))" && \
    sed -i -e "${SED_RANGE}"' s/^#//' /etc/bash.bashrc && \
    unset SED_RANGE

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

CMD [ "/bin/bash" ]