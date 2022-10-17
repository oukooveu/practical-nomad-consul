FROM jenkins/jenkins:lts
ARG MAVEN_VERSION=3.8.5
USER root
RUN \
    curl -sSL https://mirrors.estointernet.in/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar xf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt && \
    curl -sSL https://hashicorp-releases.yandexcloud.net/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip -o terraform_1.0.5_linux_amd64.zip && \
    unzip -q terraform_1.0.5_linux_amd64.zip -d /usr/local/bin && \
    curl -sSL https://nodejs.org/dist/v12.22.6/node-v12.22.6-linux-x64.tar.gz -o node-v12.22.6-linux-x64.tar.gz && \
    tar xf node-v12.22.6-linux-x64.tar.gz -C /opt && \
    curl -sSL http://ftp.br.debian.org/debian/pool/main/z/zip/zip_3.0-11+b1_amd64.deb -o zip_3.0-11+b1_amd64.deb
RUN apt install ./zip_3.0-11+b1_amd64.deb
ENV PATH="/opt/apache-maven-${MAVEN_VERSION}/bin:${PATH}"
ENV PATH="/opt/node-v12.22.6-linux-x64/bin:${PATH}"
RUN chown -R jenkins /opt/node-v12.22.6-linux-x64 && \
    chown -R jenkins /opt/apache-maven-${MAVEN_VERSION}
USER jenkins
