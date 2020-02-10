# docker build -t my/ncmpcpp .
#
# ncmpcpp() {
# 	docker run --rm -it \
# 		--net host \
# 		--name ncmpcpp \
# 		my/ncmpcpp
# }

FROM archlinux:latest

RUN pacman -Sy --noconfirm ncmpcpp && \
	yes | pacman -Scc && \
	yes | pacman -Rsn pacman && \
	rm -rf /var/lib/pacman/sync/*

RUN mkdir -p /home/ncmpcpp/.ncmpcpp
COPY bindings /home/ncmpcpp/.ncmpcpp/bindings
WORKDIR /home/ncmpcpp
RUN groupadd -r ncmpcpp && useradd -r -s /bin/false -g ncmpcpp ncmpcpp
RUN chown -R ncmpcpp:ncmpcpp /home/ncmpcpp
USER ncmpcpp

ENTRYPOINT [ "ncmpcpp" ]
CMD [ "-b", "/home/ncmpcpp/.ncmpcpp/bindings" ]
