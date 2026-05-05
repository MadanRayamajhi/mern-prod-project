FROM jenkins/jenkins:lts

USER root

# basic tools
RUN apt-get update && apt-get install -y curl git

# install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

USER jenkins
