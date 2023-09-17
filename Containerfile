FROM ghcr.io/containerpak/mesa:main
ARG DEBIAN_FRONTEND=noninteractive
RUN wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb && dpkg -i steam_latest.deb && apt install -f && rm -f steam_latest.deb
