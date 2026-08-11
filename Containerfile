FROM ubuntu:26.04 AS code-source

ARG CODE_SHA256=b73e01a1a371eb7d57f2c01712c43e9cedd15d6bad9a44261c4473db946532ef

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl && \
    curl --fail --location --output /tmp/code.deb \
      https://update.code.visualstudio.com/1.132.0/linux-deb-x64/stable && \
    echo "${CODE_SHA256}  /tmp/code.deb" | sha256sum --check -

FROM ghcr.io/containerpak/gtk:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/vscode"

COPY --from=code-source /tmp/code.deb /tmp/code.deb

RUN apt-get update && \
    apt-get install -y --no-install-recommends /tmp/code.deb && \
    rm /tmp/code.deb && \
    rm -f /usr/share/code/chrome-sandbox && \
    cpak-clean-junk
