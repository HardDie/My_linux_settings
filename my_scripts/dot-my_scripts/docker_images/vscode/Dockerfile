# docker build -t my/vscode .

FROM my/base

RUN pacman --cachedir /tmp -Sy --noconfirm code && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
USER user

ENTRYPOINT [ "code" ]
CMD [ "-w", "--no-sandbox", "-r" ]
