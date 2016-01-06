FROM debian:jessie
MAINTAINER Yoann Vanitou

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server rsync && \
    rm -rf /var/lib/apt/lists/*

# sshd needs this directory to run
RUN mkdir -p /var/run/sshd

COPY etc/ssh/sshd_config /etc/ssh/sshd_config
COPY entrypoint /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]