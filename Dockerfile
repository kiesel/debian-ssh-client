FROM debian:stretch

ENV TERRAFORM_VERSION=0.11.7
ENV TERRAFORM_SHA256SUM=6b8a7b83954597d36bbed23913dd51bc253906c612a070a21db373eab71b277b

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
  && rm -rf /var/lib/apt/lists/*

RUN terraform version