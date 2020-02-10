# docker build -t my/mpd .
#
# mpd() {
# 	docker run -d \
# 		-p 6600:6600 \
# 		-v $HOME/Music:/home/mpd/Music:ro \
# 		-v $HOME/.config/mpd:/home/mpd/database \
# 		--device /dev/snd \
# 		--name mpd \
# 		my/mpd
# }

FROM archlinux:latest

RUN pacman -Sy --noconfirm mpd && \
	yes | pacman -Scc && \
	yes | pacman -Rsn pacman && \
	rm -rf /var/lib/pacman/sync/*

RUN mkdir -p /home/mpd/database
COPY mpd.conf /home/mpd/mpd.conf
WORKDIR /home/mpd
RUN chown -R mpd:mpd /home/mpd
USER mpd

ENTRYPOINT [ "mpd" ]
CMD [ "--no-daemon", "/home/mpd/mpd.conf" ]
