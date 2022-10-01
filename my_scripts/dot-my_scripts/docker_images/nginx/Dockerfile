# docker build -t my/nginx .

FROM archlinux:latest

RUN pacman --cachedir /tmp -Sy --noconfirm nginx && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

RUN mkdir /app
RUN mkdir /app/cfg
RUN mkdir /app/html

WORKDIR /app

ENTRYPOINT [ "nginx" ]
CMD [ "-c", "/app/cfg/nginx.conf", "-g", "daemon off;" ]
