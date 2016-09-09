FROM ubuntu
MAINTAINER motoskia

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get -y install ansible
RUN apt-get -y install python-pip
RUN pip install https://github.com/willthames/ansible-lint/archive/master.zip
RUN apt-get -y install rubygems-integration
RUN gem install serverspec
RUN gem install rake

# Required for Docker jenkins plugin
RUN apt-get -y install openssh-server
RUN mkdir /var/run/sshd
RUN apt-get install openjdk-7-jdk -y
RUN useradd jenkins
# This is not safe, this is a test
RUN echo "jenkins:QwErAsDzX321" | chpasswd
RUN echo "jenkins    ALL=NOPASSWD: ALL" >> /etc/sudoers
