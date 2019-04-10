FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

ADD https://chromium.googlesource.com/chromium/src/+/master/build/install-build-deps.sh?format=TEXT /tmp/install-build-deps.sh.base64
RUN base64 -d /tmp/install-build-deps.sh.base64 > /tmp/install-build-deps.sh \
  && \
  apt-get -y update \
  && \
  apt-get install -f -y build-essential gcc-4.8 g++-4.8 docker.io \
  && \
  bash /tmp/install-build-deps.sh --lib32 --no-prompt \
     --no-chromeos-fonts \
  && \
  rm -rf /var/lib/apt/lists/*

