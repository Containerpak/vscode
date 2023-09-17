FROM ghcr.io/containerpak/mesa:main
ARG DEBIAN_FRONTEND=noninteractive
RUN wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb && dpkg -i steam.deb && apt install -f && rm -f steam.deb
