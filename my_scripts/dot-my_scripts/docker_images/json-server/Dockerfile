# docker build -t my/json-server .

FROM archlinux:latest

RUN useradd -r -s /bin/false -m -g users user
WORKDIR /home/user

RUN pacman --cachedir /tmp -Sy --noconfirm npm && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN npm install -g json-server

USER user

ENTRYPOINT [ "json-server" ]
CMD [ "--watch", "/home/user/db.json", "--port", "3000" ]
