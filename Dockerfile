FROM debian:stretch

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    bash \
    netcat-openbsd \
    openssh-client \
    openssl

