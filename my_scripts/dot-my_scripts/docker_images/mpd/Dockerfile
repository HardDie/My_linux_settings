# docker build -t my/mpd .
#
# mpd() {
# 	docker run --rm -d \
# 		--net host \
# 		-v $HOME/Music:/home/mympd/Music:ro \
# 		-v $HOME/.config/mpd:/home/mympd/database \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-v $XDG_RUNTIME_DIR/pulse:/tmp/pulse \
# 		--name mpd \
# 		my/mpd
# }

FROM archlinux:latest

RUN pacman -Sy --noconfirm mpd && \
	yes | pacman -Scc && \
	yes | pacman -Rsn pacman && \
	rm -rf /var/lib/pacman/sync/*

RUN useradd -u 1000 -r -s /bin/false -m -g users mympd
RUN chown mympd:users /tmp

WORKDIR /home/mympd
USER mympd
RUN mkdir -p /home/mympd/database
COPY mpd.conf /home/mympd/mpd.conf

ENTRYPOINT [ "mpd" ]
CMD [ "--no-daemon", "/home/mympd/mpd.conf" ]
