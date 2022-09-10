# docker build -t my/steam .

FROM my/base

RUN echo -e '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
	pacman --cachedir /tmp -Sy --noconfirm steam xorg-xwayland && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

WORKDIR /home/user
USER user

ENTRYPOINT [ "steam" ]
CMD [ "-no-cef-sandbox" ]
