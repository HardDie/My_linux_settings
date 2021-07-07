# docker build -t my/vscode .

FROM archlinux:latest

RUN useradd -u 1000 -r -s /bin/false -m -g users vscode
WORKDIR /home/vscode

RUN pacman --cachedir /tmp -Syyu --noconfirm code && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown vscode:users /tmp
USER vscode

ENTRYPOINT [ "code" ]
CMD [ "-w" ]
