FROM sitespeedio/firefox:41.0

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install software-properties-common unzip

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Gradle
ENV GRADLE_VERSION 2.7
ENV GRADLE_HASH fe801ce2166e6c5b48b3e7ba81277c41
WORKDIR /usr/lib
RUN wget https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
RUN echo "${GRADLE_HASH} gradle-${GRADLE_VERSION}-bin.zip" > gradle-${GRADLE_VERSION}-bin.zip.md5
RUN md5sum -c gradle-${GRADLE_VERSION}-bin.zip.md5
RUN unzip "gradle-${GRADLE_VERSION}-bin.zip"
RUN ln -s "/usr/lib/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle
RUN rm "gradle-${GRADLE_VERSION}-bin.zip"
RUN mkdir -p /usr/src/app

# Set Appropriate Environmental Variables
ENV GRADLE_HOME /usr/src/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

# Caches
VOLUME /root/.gradle/caches

USER $USER
# Default command is "/usr/bin/gradle -version" on /usr/bin/app dir
# (ie. Mount project at /usr/bin/app "docker --rm -v /path/to/app:/usr/bin/app gradle <command>")
#VOLUME /usr/bin/app
WORKDIR /usr/bin/app
