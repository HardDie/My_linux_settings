# docker build -t my/waterfoxg3 .
#
# waterfoxg3() {
# 	docker run --rm -d \
# 		--memory 2048m \
# 		--oom-kill-disable \
# 		--cpus=1 \
# 		--net host \
# 		-v /dev/shm:/dev/shm \
# 		-v $HOME/.config/waterfoxg3:/home/waterfox \
# 		-e DISPLAY=unix${DISPLAY} \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/pulse:/tmp/pulse \
# 		--name waterfoxg3 \
# 		my/waterfoxg3
# }

FROM archlinux:latest

RUN useradd -u 1000 -r -s /bin/false -m -g users -G audio waterfox
WORKDIR /home/waterfox

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman --cachedir /tmp -Sy --noconfirm git sudo fakeroot binutils make gcc && \
	pacman --cachedir /tmp -Sy --noconfirm libxt libnotify mime-types nss gtk2 gtk3 dbus-glib startup-notification ffmpeg ttf-font gettext && \
	sudo -u waterfox sh -c "cd /tmp && git clone https://aur.archlinux.org/waterfox-g3-bin.git waterfox && cd waterfox && makepkg" && \
	pacman -U --noconfirm /tmp/waterfox/waterfox-g3-bin-*.pkg.tar.* && \
	pacman -Scc --noconfirm && \
	pacman -Rsn --noconfirm git sudo fakeroot binutils make gcc && \
	rm -rf /tmp/*

RUN chown waterfox:users /tmp
USER waterfox

ENTRYPOINT [ "waterfox-g3" ]
