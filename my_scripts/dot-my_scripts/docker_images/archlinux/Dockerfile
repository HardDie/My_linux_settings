# docker build -t arch .

FROM archlinux:latest

COPY mirrorlist /etc/pacman.d/mirrorlist

# Update packages
RUN pacman --cachedir /tmp -Syyu --noconfirm && \
	rm -rf /tmp/*
