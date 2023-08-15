# docker build -t my/telegram .

FROM my/base

RUN pacman --cachedir /tmp -Sy --noconfirm telegram-desktop icu && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
WORKDIR /home/user
USER user

ENTRYPOINT [ "telegram-desktop" ]
