# docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t my/base .

FROM archlinux:latest

# Update packages
RUN pacman --cachedir /tmp -Syyu --noconfirm

# Install common packages
RUN pacman --cachedir /tmp -S --noconfirm gtk2 gtk3 mesa qt6-base && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

# Update packages
RUN pacman --cachedir /tmp -Syyu --noconfirm && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

# id -u
ARG UID=1000
# id -g
ARG GID=984
RUN useradd -r -s /bin/false -m -u $UID -g $GID -g users user
