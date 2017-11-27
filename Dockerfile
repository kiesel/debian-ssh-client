FROM debian:stretch

ENV TERRAFORM_VERSION=0.11.0
ENV TERRAFORM_SHA256SUM=402b4333792967986383670134bb52a8948115f83ab6bda35f57fa2c3c9e9279

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    unzip \
  && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && echo "${TERRAFORM_SHA256SUM} terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  && sha256sum -c terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin \
  && rm -f terraform_${TERRAFORM_VERSION}_* \
  && apt-get -y remove unzip curl \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/dists/*

RUN terraform version