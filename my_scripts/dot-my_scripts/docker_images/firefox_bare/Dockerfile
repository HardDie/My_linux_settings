# docker build -t my/firefox_bare .

FROM my/base

RUN pacman --cachedir /tmp -Sy --noconfirm firefox && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
WORKDIR /home/user
USER user

ENTRYPOINT [ "firefox" ]
