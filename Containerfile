FROM ghcr.io/containerpak/mesa:main

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y wget git gpg && \
    wget -O code.deb https://update.code.visualstudio.com/1.100.2/linux-deb-x64/stable && \
    dpkg -i code.deb || true && \
    apt install -f -y && \
    rm -f code.deb && \
    /usr/bin/cpak-clean-junk
