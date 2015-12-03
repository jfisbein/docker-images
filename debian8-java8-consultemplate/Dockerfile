FROM jfisbein/docker-images:debian8-java8
MAINTAINER Joan Fisbein <joan@fisbein.com>

ENV DEBIAN_FRONTEND noninteractive
ENV consul_template_ver 0.11.1

# Install consult template
RUN wget --retry-connrefused -t 5 https://releases.hashicorp.com/consul-template/${consul_template_ver}/consul-template_${consul_template_ver}_linux_amd64.zip -O /tmp/consul-template.zip
RUN unzip /tmp/consul-template -d /usr/local/bin/
RUN chmod +x /usr/local/bin/consul-template
RUN mkdir -p /etc/consul-template/templates
