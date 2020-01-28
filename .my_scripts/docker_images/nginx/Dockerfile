# docker build -t my/nginx .
#
# nginx() {
# 	docker run -d \
# 		--net host \
# 		-v /nginx/config:/app/cfg:ro \
# 		-v /nginx/html:/app/html:ro \
# 		--name nginx \
# 		my/nginx
# }

FROM archlinux:latest

RUN pacman -Sy --noconfirm nginx

RUN mkdir /app
RUN mkdir /app/cfg
RUN mkdir /app/html

WORKDIR /app

CMD [ "nginx", "-c", "/app/cfg/nginx.conf", "-g", "daemon off;" ]
