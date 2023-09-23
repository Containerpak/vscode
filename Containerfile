FROM ghcr.io/containerpak/mesa:main
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y wget gpg && \
    wget -O code.deb https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.82.2-1694671812_amd64.deb && \
    dpkg -i code.deb || true && \
    apt install -f -y && \
    rm -f code.deb && \
    /usr/bin/cpak-clean-junk
