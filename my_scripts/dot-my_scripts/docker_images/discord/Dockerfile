# docker build -t my/discord .

FROM archlinux:latest

RUN useradd -s /bin/false -m -g users discord
WORKDIR /home/discord

RUN pacman --cachedir /tmp -Sy --noconfirm discord libpulse alsa-lib && \
	pacman -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown discord:users /tmp
USER discord

ENTRYPOINT [ "discord" ]
CMD [ "--no-sandbox" ]
