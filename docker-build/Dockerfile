FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  automake \
  libtool \
  libglib2.0-dev \
  libzip-dev \
  pkg-config \
  libudev-dev \
  libusb-1.0-0-dev \
  python3-dev \
  cmake \
  qt5-default \
  libfftw3-dev \
  libboost-dev \
  libboost-filesystem-dev \
  libboost-system-dev \
  libboost-thread-dev \
  sudo \
  wget \
  fuse

ADD docker-build/compile.sh .
RUN chmod +x compile.sh

# create user with sudo
ENV user=user

RUN useradd -m -d /home/${user} ${user} && \
    chown -R ${user} /home/${user} && \
    adduser ${user} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/${user}

COPY DSView ./DSView
COPY NEWS* ug* ./
COPY libsigrok4DSL ./libsigrok4DSL
COPY libsigrokdecode4DSL ./libsigrokdecode4DSL
RUN chown -R ${user}:${user} ./*

USER ${user}

CMD /compile.sh