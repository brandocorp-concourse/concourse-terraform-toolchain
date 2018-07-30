FROM ubuntu:16.04

ARG BASE_URL="https://releases.hashicorp.com/terraform"
ARG TERRAFORM_VERSION="0.11.7"

RUN TERRAFORM_VERSION=${TERRAFORM_VERSION}:-"cat " apt-get update -y -q \
  && apt-get install -y curl git jq wget zip \
  && wget ${BASE_URL}/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && install -m 755 terraform /bin

ENTRYPOINT ["/bin/bash", "-l", "-c"]

WORKDIR /root
