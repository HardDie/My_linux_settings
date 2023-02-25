# docker build -t my/steam .

FROM my/base

RUN sed -ie 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	locale-gen

RUN echo -e '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
	pacman --cachedir /tmp -Sy --noconfirm steam xorg-xwayland && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

WORKDIR /home/user
USER user

ENTRYPOINT [ "steam" ]
CMD [ "-no-cef-sandbox" ]
