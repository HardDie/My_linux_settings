# docker build -t my/htop .
#
# htop() {
# 	docker run --rm -it \
# 		--pid host \
# 		--name htop \
# 		my/htop
# }

FROM archlinux:latest

RUN pacman -Sy --noconfirm htop

RUN mkdir /app
RUN groupadd -r htop && useradd -r -s /bin/false -g htop htop
WORKDIR /app
RUN chown -R htop:htop /app
USER htop

CMD [ "htop" ]
