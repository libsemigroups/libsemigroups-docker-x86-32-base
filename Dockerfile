FROM i386/ubuntu:bionic

MAINTAINER James D. Mitchell <jdm3@st-andrews.ac.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
      && apt-get install -y \
      automake \
      autoconf \
      build-essential \
      curl \
      git \
      libtool \
      m4 \
      pkg-config \
      sudo \
      vim

RUN useradd -m -s /bin/zsh linuxbrew && \
    usermod -aG sudo linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew: /home/linuxbrew/.linuxbrew
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
USER root
RUN chown -R $CONTAINER_USER: /home/linuxbrew/.linuxbrew
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN git config --global --add safe.directory /home/linuxbrew/.linuxbrew/Homebrew
USER linuxbrew
RUN brew install node@20

RUN adduser --quiet --shell /bin/bash --gecos "libsemigroups user,101,," --disabled-password libsemigroups \
        && adduser libsemigroups sudo \
        && chown -R libsemigroups:libsemigroups /home/libsemigroups/ \
        && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
        && cd /home/libsemigroups \
        && touch .sudo_as_admin_successful

USER libsemigroups

ENV HOME /home/libsemigroups

WORKDIR home/libsemigroups
