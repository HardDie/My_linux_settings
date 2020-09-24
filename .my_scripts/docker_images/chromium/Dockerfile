# docker build -t my/chromium .
#
# chromium() {
# 	mkdir /tmp/chromium_tmp
#
# 	docker run --rm -d \
# 		--memory 2048m \
# 		--oom-kill-disable \
# 		--cpus=1 \
# 		--net host \
# 		--device /dev/dri \
# 		-v /tmp/chromium_tmp:/home/chromium/Downloads \
# 		-v /dev/shm:/dev/shm \
# 		-e DISPLAY=unix$DISPLAY \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/pulse:/tmp/pulse \
# 		--name chromium \
# 		my/chromium
# }

FROM archlinux:latest

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman -Syyu --noconfirm chromium && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync/* && \
	rm -rf /var/cache/pacman/pkg/*

RUN useradd -u 1000 -r -s /bin/false -m -g users -G audio chromium
RUN chown chromium:users /tmp
WORKDIR /home/chromium
USER chromium

ENTRYPOINT [ "chromium" ]
CMD [ "--no-sandbox" ]
