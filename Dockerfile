FROM archlinux:base-devel-20231001.0.182270


# makepkg cannot (and should not) be run as root:
RUN useradd -m notroot
# Generally, refreshing without sync'ing is discouraged, but we've a clean
# environment here.
RUN pacman -Sy --noconfirm base-devel curl git

# Allow notroot to run stuff as root (to install dependencies):
RUN echo "notroot ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/notroot

RUN git clone https://aur.archlinux.org/debtap.git && \
    chown -R notroot debtap/ 
USER notroot

# Install debtap - A script for converting .deb packages into Arch Linux packages - https://github.com/helixarch/debtap
RUN cd debtap && \
    makepkg -si --noconfirm

USER root
WORKDIR /pkg

COPY build-deb.sh /build-deb.sh

# Build the package
CMD /bin/bash /build-deb.sh
