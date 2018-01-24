FROM oberthur/docker-ubuntu:16.04

MAINTAINER Michal Dziedziela <m.dziedziela@oberthur.com>

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install dnsmasq

COPY dnsmasq.conf /etc/dnsmasq.conf
RUN mkdir -p /var/run/

# Replace SIGTERM with SIGCONT as stop signal to support graceful
# termination
STOPSIGNAL SIGCONT

ENTRYPOINT ["/usr/sbin/dnsmasq", "--keep-in-foreground"]