FROM marcellodesales/gradle-java
MAINTAINER Marcello de Sales <marcello.desales@gmail.com>

# Setup Firefox and the fonts
RUN \
apt-get update && \
apt-get install -y \
firefox \
ca-certificates \
xfonts-100dpi \
xfonts-75dpi \
xfonts-scalable \
xfonts-cyrillic \
xvfb --no-install-recommends && \
apt-get clean autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Solvin the link of the latest library https://github.com/marcellodesales/gradle-java-docker/blob/master/Dockerfile#L25
RUN \
mkdir -p /usr/lib/mozilla/plugins \
ln -s /opt/java/jre/lib/amd64/libnpjp2.so /usr/lib/mozilla/plugins
