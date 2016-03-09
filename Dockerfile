FROM debian:jessie
MAINTAINER Yoann Vanitou

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server rsync && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd

COPY etc/ssh/sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]