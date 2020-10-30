# docker build -t my/intellij .
#
# intellij() {
# 	docker run --rm -d \
# 		--net host \
# 		-v /dev/shm:/dev/shm \
# 		-v $HOME/.config/goland:/home/goland \
# 		-v $HOME/go:/home/goland/go \
# 		-v $HOME/.vimrc:/home/goland/.ideavimrc:ro \
# 		-e _JAVA_AWT_WM_NONREPARENTING=1 \
# 		-e DISPLAY=unix$DISPLAY \
# 		-e XDG_RUNTIME_DIR=/tmp \
# 		-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
# 		-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
# 		--name intellij \
# 		my/intellij
# }

FROM archlinux:latest

RUN useradd -u 1000 -r -s /bin/false -m -g users goland
WORKDIR /home/goland

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman -Sy --noconfirm go git sudo fakeroot binutils make gcc gettext && \
	pacman -Sy --noconfirm libxext libxrender libxtst freetype2 adobe-source-code-pro-fonts fontconfig && \
	sudo -u goland sh -c "git clone https://aur.archlinux.org/yay.git /tmp/yay" && \
	sudo -u goland sh -c "cd /tmp/yay && makepkg" && \
	pacman -U --noconfirm /tmp/yay/yay-*.pkg.tar.* && \
	sudo -u goland sh -c "cd /tmp && yay -G intellij-idea-ultimate-edition" && \
	sudo -u goland sh -c "cd /tmp/intellij-idea-ultimate-edition && makepkg" && \
	pacman -U --noconfirm /tmp/intellij-idea-ultimate-edition/intellij-idea-ultimate-edition-*.pkg.tar.* && \
	rm -rf /tmp/yay /tmp/intellij-idea-ultimate-edition && \
	rm -rf /home/goland/.cache/ && \
	pacman -Rsn --noconfirm sudo fakeroot make gettext yay && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync/* && \
	rm -rf /var/cache/pacman/pkg/*

RUN chown goland:users /tmp
USER goland

ENTRYPOINT [ "intellij-idea-ultimate-edition" ]

