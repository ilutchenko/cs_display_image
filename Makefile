IMG_NAME="cs-display-image"

docker-init:    ## Initialize docker image
	git submodule update --init --recursive
	docker build -t $(IMG_NAME) .