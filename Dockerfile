FROM jenkins/jenkins:lts-alpine
USER root

# Pipeline
RUN /usr/local/bin/install-plugins.sh workflow-aggregator && \
    /usr/local/bin/install-plugins.sh ws-cleanup && \
    /usr/local/bin/install-plugins.sh greenballs && \
    /usr/local/bin/install-plugins.sh simple-theme-plugin && \
    /usr/local/bin/install-plugins.sh kubernetes && \
    /usr/local/bin/install-plugins.sh docker-workflow && \
    /usr/local/bin/install-plugins.sh github && \
    /usr/local/bin/install-plugins.sh github-branch-source && \
    /usr/local/bin/install-plugins.sh cloudbees-bitbucket-branch-source && \
    /usr/local/bin/install-plugins.sh kubernetes-cli 

# install Maven, Java, Docker
RUN apk add docker \
    gettext

# Kubectl
RUN  wget https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN curl -s https://get.helm.sh/helm-v3.1.0-linux-amd64.tar.gz | tar xvz -C /tmp && cp /tmp/linux-amd64/helm /usr/local/bin/helm

# Need to ensure the gid here matches the gid on the host node. We ASSUME (hah!) this
# will be stable....keep an eye out for unable to connect to docker.sock in the builds
# RUN delgroup ping && delgroup docker && addgroup -g 999 docker && addgroup jenkins docker

# See https://github.com/kubernetes/minikube/issues/956.
# THIS IS FOR MINIKUBE TESTING ONLY - it is not production standard (we're running as root!)
RUN chown -R root "$JENKINS_HOME" /usr/share/jenkins/ref