FROM i386/ubuntu:focal

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

RUN adduser --quiet --shell /bin/bash --gecos "libsemigroups user,101,," --disabled-password libsemigroups \
        && adduser libsemigroups sudo \
        && chown -R libsemigroups:libsemigroups /home/libsemigroups/ \
        && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
        && cd /home/libsemigroups \
        && touch .sudo_as_admin_successful

USER libsemigroups

ENV HOME /home/libsemigroups

WORKDIR home/libsemigroups
