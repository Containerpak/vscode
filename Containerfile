FROM ghcr.io/containerpak/mesa:main
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y curl gnupg2 && \
    curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg && \
    echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list && \
    apt update && \
    apt install -y spotify-client && \
    /usr/bin/cpak-clean-junk
