FROM ubuntu:20.04

# setup tz https://stackoverflow.com/questions/44331836/apt-get-install-tzdata-noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
    apt-get install -y tzdata

# install req. packages
RUN apt-get install -y \
    curl \
    zip \
    gnupg \
    software-properties-common \
    python3-pip

# install aws cli https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# install terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install terraform -y
