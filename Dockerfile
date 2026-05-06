FROM jenkins/jenkins:lts

USER root

# install Node.js + npm
RUN apt update && apt install -y curl \
 && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt install -y nodejs

# docker CLI support (optional but needed for deploy)
RUN apt install -y docker.io

USER jenkins

