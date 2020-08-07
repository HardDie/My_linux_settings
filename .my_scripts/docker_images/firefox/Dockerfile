# docker build -t my/firefox .
#
# firefox() {
# 	mkdir /tmp/firefox_tmp
#
# 	docker run --rm -d \
# 		--memory 2048m \
# 		--oom-kill-disable \
# 		--cpus=1 \
# 		--net host \
# 		--device /dev/dri \
# 		-v /tmp/firefox_tmp:/home/firefox/Downloads \
# 		-v /dev/shm:/dev/shm \
# 		-e DISPLAY=unix$DISPLAY \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/pulse:/tmp/pulse \
# 		--name firefox \
# 		my/firefox "$@"
# }

FROM archlinux:latest

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman -Syyu --noconfirm firefox git make && \
	git clone https://github.com/girst/LegacyFox-mirror-of-git.gir.st /tmp/patch && \
	make -C /tmp/patch install && \
	pacman -Rsn --noconfirm git make && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync/* && \
	rm -rf /var/cache/pacman/pkg/*

RUN useradd -u 1000 -r -s /bin/false -m -g users -G audio firefox
RUN chown firefox:users /tmp
WORKDIR /home/firefox
USER firefox

ENTRYPOINT [ "firefox" ]
