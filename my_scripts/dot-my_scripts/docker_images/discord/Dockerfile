# docker build -t my/discord .

FROM archlinux:latest

RUN useradd -u 1000 -r -s /bin/false -m -g users -G audio discord
WORKDIR /home/discord

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman --cachedir /tmp -Sy --noconfirm discord && \
	pacman -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown discord:users /tmp
USER discord

ENTRYPOINT [ "discord" ]
CMD [ "--no-sandbox" ]
