FROM debian:jessie
MAINTAINER Joan Fisbein <joan@fisbein.com>

ENV DEBIAN_FRONTEND noninteractive

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y upgrade && apt-get clean

# Install Oracle JDK 7
## Install webupd8 repositories
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

## Accept Oracle License
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get update
RUN apt-get -y --no-install-recommends install oracle-java7-installer oracle-java7-set-default oracle-java7-unlimited-jce-policy ca-certificates && \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer/jdk-*.tar.gz && \
    rm -rf /var/cache/oracle-jdk8-installer/UnlimitedJCEPolicyJDK8 && \
    rm -rf /var/cache/oracle-jdk8-installer/*.zip
