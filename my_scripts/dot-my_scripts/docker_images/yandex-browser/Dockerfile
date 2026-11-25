# docker build -t my/yandex-browser .

# Build yandex-browser packet
FROM my/base AS yandex-browser-build
RUN pacman --cachedir /tmp -Sy --noconfirm git sudo fakeroot binutils make gcc startup-notification mime-types dbus-glib ffmpeg ttf-font nss debugedit ttf-liberation jq gtk4 squashfs-tools wget && \
	sudo -u user sh -c "cd /tmp && git clone https://aur.archlinux.org/yandex-browser.git yandex-browser && cd yandex-browser && makepkg"

# Install yandex-browser and environment
FROM my/base AS my_yandex-browser
COPY --from=yandex-browser-build /tmp/yandex-browser/*.pkg.tar.* /tmp/
RUN pacman --cachedir /tmp -U --noconfirm /tmp/*.pkg.tar.* && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

COPY cert.pem /etc/ca-certificates/trust-source/anchors
RUN chown user:users /tmp
USER user

ENTRYPOINT [ "yandex-browser-stable" ]
CMD [ "--no-sandbox", "--ozone-platform=wayland" ]
