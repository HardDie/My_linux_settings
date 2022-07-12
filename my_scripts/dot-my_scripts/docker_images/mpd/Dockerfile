# docker build -t my/mpd .

FROM archlinux:latest

RUN pacman --cachedir /tmp -Sy --noconfirm mpd && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN useradd -r -s /bin/false -m -g users user
RUN chown user:users /tmp

WORKDIR /home/user
USER user
RUN mkdir -p /home/user/database
COPY mpd.conf /home/user/mpd.conf

ENTRYPOINT [ "mpd" ]
CMD [ "--no-daemon", "/home/user/mpd.conf" ]
