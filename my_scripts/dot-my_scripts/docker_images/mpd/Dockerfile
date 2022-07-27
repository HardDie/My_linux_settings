# docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t my/mpd .

FROM archlinux:latest

RUN pacman --cachedir /tmp -Sy --noconfirm mpd && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

# id -u
ARG UID=1000
# id -g
ARG GID=984
RUN useradd -r -s /bin/false -m -u $UID -g $GID -g users user
RUN chown user:users /tmp

WORKDIR /home/user
USER user
RUN mkdir -p /home/user/database
COPY mpd.conf /home/user/mpd.conf

ENTRYPOINT [ "mpd" ]
CMD [ "--no-daemon", "/home/user/mpd.conf" ]
