# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.

FROM jfisbein/docker-images:debian8-java8
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
