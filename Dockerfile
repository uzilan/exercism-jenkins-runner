FROM jenkins/jenkins:lts
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY config.xml /usr/share/jenkins/ref/jobs/exercism/config.xml
USER root
RUN cd /tmp \
    && wget https://github.com/exercism/cli/releases/download/v3.0.12/exercism-linux-64bit.tgz \
    && tar -xf exercism-linux-64bit.tgz \
    && mv /tmp/exercism /usr/local/bin/exercism \
    && wget https://services.gradle.org/distributions/gradle-5.5.1-bin.zip \
    && unzip gradle-5.5.1-bin.zip \
    && mv gradle-5.5.1 /usr/local/bin/gradle-5.5.1

RUN exercism configure --token=<your token here>
ENV GRADLE_HOME=/usr/local/bin/gradle-5.5.1
ENV PATH=$PATH:$GRADLE_HOME/bin