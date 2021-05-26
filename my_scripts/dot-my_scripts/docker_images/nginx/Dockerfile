# docker build -t my/nginx .
#
# nginx() {
# 	docker run -d \
# 		--memory 512m \
# 		--oom-kill-disable \
# 		--cpus=1 \
# 		--net host \
# 		-v $HOME/.config/nginx:/app:ro \
# 		--name nginx \
# 		my/nginx
# }

FROM archlinux:latest

RUN pacman -Sy --noconfirm nginx && yes | pacman -Scc && yes | pacman -Rsn pacman && rm -rf /var/lib/pacman/sync/*

RUN mkdir /app
RUN mkdir /app/cfg
RUN mkdir /app/html

WORKDIR /app

ENTRYPOINT [ "nginx" ]
CMD [ "-c", "/app/cfg/nginx.conf", "-g", "daemon off;" ]
