FROM ghcr.io/containerpak/gtk:main

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
    ca-certificates dpkg libasound2t64 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 \
    libcups2 libcurl4 libdbus-1-3 libgbm1 libgtk-3-0 libnspr4 libnss3 libx11-6 \
    libxcb1 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxkbcommon0 libxkbfile1 \
    libxrandr2 xdg-utils && \
    cpak-clean-junk
