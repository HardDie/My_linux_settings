#!/bin/bash

is_exist() {
	docker image inspect $1 2>&1 >/dev/null
	if [[ $? -eq 0 ]]; then
		return 0
	fi
	return 1
}

build() {
	local NAME=$1
	local IMAGE_NAME=my/$1
	echo "Building ${NAME} image..."

	is_exist $IMAGE_NAME
	if [[ $? -eq 0 ]]; then
		docker image tag $IMAGE_NAME $IMAGE_NAME:old
	fi
	cd $NAME
	docker build -t $IMAGE_NAME .
	cd ..
	echo "${NAME} was successfully build!"
}

UPDATE="!true"
if [[ ${UPDATE} == "true" ]]; then
	# Update archlinux image
	echo "Updating archlinux image..."
	docker pull archlinux:latest

	# Install updates and change repository file
	echo "Installing upgrades for linux image..."
	cd archlinux
	cp /etc/pacman.d/mirrorlist .
	docker build -t archlinux --no-cache .
	cd ..

	# Update my/base image
	echo "Building base image..."
	cd base
	docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t my/base .
	cd ..
fi

build intellij
build steam
build chromium
build firefox_bare
build firefox
build mpd
build telegram
build vscode
build waterfox
build discord
