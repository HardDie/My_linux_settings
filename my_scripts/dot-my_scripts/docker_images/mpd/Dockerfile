# docker build -t my/mpd .

FROM my/base

RUN pacman --cachedir /tmp -Sy --noconfirm mpd && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
WORKDIR /home/user
USER user
RUN mkdir -p /home/user/database
COPY mpd.conf /home/user/mpd.conf

ENTRYPOINT [ "mpd" ]
CMD [ "--no-daemon", "/home/user/mpd.conf" ]
