FROM ubuntu:16.04

ENV NPM_CONFIG_LOGLEVEL warn
ENV DEBIAN_FRONTEND noninteractive
EXPOSE 80
  
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install software-properties-common git npm default-jre-headless

# For Mongo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5

# Install Ansible
RUN add-apt-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get -y install ansible 

# The Ubuntu image does not create a default user
RUN useradd -m app
USER app

RUN mkdir -p /home/app/src/xForge
WORKDIR /home/app/src/xForge
RUN git clone https://github.com/sillsdev/web-languageforge web-languageforge --recurse-submodules
RUN ln -s web-languageforge web-scriptureforge

WORKDIR /home/app/src/xForge/web-languageforge/deploy
RUN ansible-playbook -i hosts playbook_create_config.yml --limit localhost -K

#
# Broken
#
RUN ansible-playbook playbook_xenial.yml --limit localhost -K

#WORKDIR ..
#RUN ./refreshDeps.sh

CMD ["tail", "-f", "/dev/null"]

