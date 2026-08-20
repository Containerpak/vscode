FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/vscode"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates libasound2t64 libnss3 libxss1 xdg-utils && \
    cpak-clean-junk

COPY code /usr/local/bin/code
COPY code.desktop /usr/share/applications/code.cpak.desktop
COPY code-url-handler.desktop /usr/share/applications/code-url-handler.cpak.desktop

RUN chmod 0755 /usr/local/bin/code
