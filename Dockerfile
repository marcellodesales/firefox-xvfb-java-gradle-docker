FROM marcellodesales/gradle-java
MAINTAINER Marcello de Sales <marcello.desales@gmail.com>

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
