# docker build -t my/intellij .

# Build intellij packet
FROM my/base AS intellij-build
RUN pacman --cachedir /tmp -Sy --noconfirm git sudo fakeroot binutils make gcc gettext && \
	sudo -u user sh -c "cd /tmp && git clone https://aur.archlinux.org/intellij-idea-ultimate-edition.git intellij && cd intellij && makepkg"

# Install intellij and environment
FROM my/base AS my_intellij
COPY --from=intellij-build /tmp/intellij/*.pkg.tar.* /tmp/
RUN pacman --cachedir /tmp -U --noconfirm /tmp/*.pkg.tar.* && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

# Install dependency
RUN pacman --cachedir /tmp -Sy --noconfirm git go && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN chown user:users /tmp
USER user

ENTRYPOINT [ "intellij-idea-ultimate-edition" ]

