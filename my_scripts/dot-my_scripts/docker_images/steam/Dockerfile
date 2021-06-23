# docker build -t my/steam .
#
# steam() {
# 	mkdir -p /tmp/telegram_tmp
# 
# 	docker run --rm -d \
# 		--memory 1024m \
# 		--oom-kill-disable \
# 		--cpus=1 \
# 		--net host \
# 		-v /dev/shm:/dev/shm \
# 		-e DISPLAY=unix$DISPLAY \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/pulse:/tmp/pulse \
# 		-v $XDG_RUNTIME_DIR/bus:/tmp/bus \
# 		-v $HOME/.config/telegram:/home/telegram/.local/share \
# 		-v /etc/localtime:/etc/localtime:ro \
# 		--name telegam \
# 		my/telegram
# }

FROM archlinux:latest

RUN echo -e '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
	pacman --cachedir /tmp -Sy --noconfirm steam xorg-xwayland && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync/* && \
	rm -rf /var/cache/pacman/pkg/* && \
	rm -rf /tmp/*

RUN useradd -u 1000 -r -s /bin/bash -m -g users steam
RUN chown steam:users /tmp
WORKDIR /home/steam
USER steam

ENTRYPOINT [ "steam" ]
