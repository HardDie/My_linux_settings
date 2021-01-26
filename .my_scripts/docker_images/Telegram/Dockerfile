# docker build -t my/telegram .
#
# telegram() {
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

RUN pacman -Sy --noconfirm telegram-desktop icu && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync/* && \
	rm -rf /var/cache/pacman/pkg/*

RUN useradd -u 1000 -r -s /bin/false -m -g users telegram
RUN chown telegram:users /tmp
WORKDIR /home/telegram
USER telegram

ENTRYPOINT [ "telegram-desktop" ]
