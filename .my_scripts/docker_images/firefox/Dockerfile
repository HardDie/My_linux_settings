# docker build -t my/firefox .
#
# firefox() {
# 	docker run --rm -d \
# 		--net host \
# 		--device /dev/snd \
# 		--device /dev/dri \
# 		-v /dev/shm:/dev/shm \
# 		-e DISPLAY=unix$DISPLAY \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
# 		--name firefox \
# 		my/firefox
# }

FROM archlinux:latest

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman -Sy --noconfirm firefox && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync/*

RUN useradd -u 1000 -r -s /bin/false -m -g users -G audio firefox
WORKDIR /home/firefox
USER firefox

ENTRYPOINT [ "firefox" ]
