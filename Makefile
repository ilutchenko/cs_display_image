IMG_NAME="cs-display-image"
CONTAINER_NAME="cs_display_work"
SRC_DIR=${PWD}
WORK_DIR="/data"

DOCKER_RUN=docker run \
			--rm \
			-it \
			--name ${CONTAINER_NAME} \
			-v ${SRC_DIR}:${WORK_DIR}:rw \

all:            ## Configure enviroment and run Yocto build
	${DOCKER_RUN} ${IMG_NAME} bash ${WORK_DIR}/build.sh

flash:
	sudo dd if=/home/ilutchenko/workspace/cas-display-image/meta-layers/build/tmp/deploy/images/stm32mp1/FlashLayout_sdcard_stm32mp157f-dk2-extensible.raw of=/dev/sdc bs=8M conv=fdatasync status=progress oflag=direct
 
docker-init:    ## Initialize docker image
	git submodule update --init --recursive
	docker build -t $(IMG_NAME) .