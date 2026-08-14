FROM ubuntu:26.04 AS code-source

ADD --checksum=sha256:b73e01a1a371eb7d57f2c01712c43e9cedd15d6bad9a44261c4473db946532ef https://update.code.visualstudio.com/1.132.0/linux-deb-x64/stable /tmp/code.deb

FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/vscode"

RUN --mount=type=bind,from=code-source,source=/tmp/code.deb,target=/run/code.deb \
    apt-get update && \
    apt-get install -y --no-install-recommends /run/code.deb && \
    rm -f /usr/share/code/chrome-sandbox && \
    cpak-clean-junk
