# docker build -t my/waterfox .
#
# waterfox() {
# 	docker run --rm -d \
# 		--memory 2048m \
# 		--oom-kill-disable \
# 		--cpus=1 \
# 		--net host \
# 		-v /dev/shm:/dev/shm \
# 		-v $HOME/.config/waterfox:/home/waterfox \
# 		-e DISPLAY=unix${DISPLAY} \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/pulse:/tmp/pulse \
# 		--name waterfox \
# 		my/waterfox
# }

FROM archlinux:latest

RUN useradd -u 1000 -r -s /bin/false -m -g users -G audio waterfox
WORKDIR /home/waterfox

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman -Sy --noconfirm go git sudo fakeroot binutils make gcc && \
	pacman -Sy --noconfirm libxt libnotify mime-types nss gtk2 gtk3 dbus-glib startup-notification ffmpeg ttf-font gettext && \
	sudo -u waterfox sh -c "git clone https://aur.archlinux.org/yay.git /tmp/yay" && \
	sudo -u waterfox sh -c "cd /tmp/yay && makepkg" && \
	pacman -U --noconfirm /tmp/yay/yay-*.pkg.tar.* && \
	sudo -u waterfox sh -c "cd /tmp && yay -G waterfox-current-bin" && \
	sudo -u waterfox sh -c "cd /tmp/waterfox-current-bin && makepkg" && \
	pacman -U --noconfirm /tmp/waterfox-current-bin/waterfox-current-bin-*.pkg.tar.* && \
	rm -rf /tmp/yay /tmp/waterfox-current-bin && \
	rm -rf /home/waterfox/.cache/ && \
	pacman -Scc --noconfirm && \
	pacman -Rsn --noconfirm go git sudo fakeroot binutils make gcc yay && \
	rm -rf /var/lib/pacman/sync/* && \
	rm -rf /var/cache/pacman/pkg/*

RUN chown waterfox:users /tmp
USER waterfox

ENTRYPOINT [ "waterfox-current" ]
