FROM debian:stretch

RUN apt-get update \
  && apt-get install -y \
    bash \
    openssh-client

