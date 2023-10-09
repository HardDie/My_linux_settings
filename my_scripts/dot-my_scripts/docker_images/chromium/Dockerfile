# docker build -t my/chromium .

FROM my/base

RUN pacman --cachedir /tmp -Sy --noconfirm chromium && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
WORKDIR /home/user
USER user

ENTRYPOINT [ "chromium" ]
CMD [ "--no-sandbox", "--ozone-platform=wayland" ]
