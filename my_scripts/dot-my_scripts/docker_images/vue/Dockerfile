# docker build -t my/vue .

FROM archlinux:latest

RUN useradd -m -g users user

RUN pacman --cachedir /tmp -Sy --noconfirm npm gcc-libs && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

USER user
WORKDIR /home/user

ENTRYPOINT [ "bash" ]
