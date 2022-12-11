# docker build -t my/discord .

FROM my/base

RUN pacman --cachedir /tmp -Sy --noconfirm discord libpulse alsa-lib && \
	pacman -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
USER user

ENTRYPOINT [ "discord" ]
CMD [ "--no-sandbox" ]
