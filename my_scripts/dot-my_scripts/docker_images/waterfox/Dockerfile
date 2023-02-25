# docker build -t my/waterfox .

# Build waterfox packet
FROM my/base AS waterfox-build
RUN pacman --cachedir /tmp -Sy --noconfirm git sudo fakeroot binutils make gcc startup-notification mime-types dbus-glib ffmpeg ttf-font && \
	sudo -u user sh -c "cd /tmp && git clone https://aur.archlinux.org/waterfox-g4-bin.git  waterfox && cd waterfox && makepkg"

# Install waterfox and environment
FROM my/base AS my_waterfox
COPY --from=waterfox-build /tmp/waterfox/*.pkg.tar.* /tmp/
RUN pacman --cachedir /tmp -U --noconfirm /tmp/*.pkg.tar.* && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
USER user

ENTRYPOINT [ "waterfox-g4" ]
