# docker build -t my/vue .

FROM archlinux:latest

RUN useradd -m -g users user

RUN pacman --cachedir /tmp -Syyu --noconfirm npm gcc-libs yarn && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN npm install -g @vue/cli

USER user
WORKDIR /home/user

ENTRYPOINT [ "bash" ]
