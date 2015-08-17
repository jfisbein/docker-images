# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.

FROM debian:jessie
MAINTAINER Joan Fisbein <joan@fisbein.com>

ENV DEBIAN_FRONTEND noninteractive

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y upgrade && apt-get clean

# Install a basic SSH server
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Install Oracle JDK 8
## Install webupd8 repositories
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

## Accept Oracle License
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get update
RUN apt-get -y --no-install-recommends install oracle-java8-installer oracle-java8-set-default oracle-java8-unlimited-jce-policy && \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer/jdk-*.tar.gz && \
    rm -rf /var/cache/oracle-jdk8-installer/UnlimitedJCEPolicyJDK8 && \
    rm -rf /var/cache/oracle-jdk8-installer/*.zip


# Install Maven 3.2.2
RUN wget --no-verbose -O /tmp/apache-maven-3.2.2.tar.gz http://archive.apache.org/dist/maven/maven-3/3.2.2/binaries/apache-maven-3.2.2-bin.tar.gz && \
    tar xzf /tmp/apache-maven-3.2.2.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.2.2 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin && \
    rm -f /tmp/apache-maven-3.2.2.tar.gz

ENV MAVEN_HOME /opt/maven

# Add user jenkins to the image
RUN adduser --gecos '' jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
VOLUME /var/log
