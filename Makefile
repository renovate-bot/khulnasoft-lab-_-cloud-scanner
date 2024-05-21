PWD=$(shell pwd)
IMAGE_REPOSITORY?=docker.io/khulnasoft
KE_IMG_TAG?=latest
VERSION?=`git describe --tags`

.PHONY: bootstrap docker push steampipe-docker steampipe-docker-push

bootstrap:
	git submodule update --init --recursive --remote

steampipe-docker:
	docker build -t $(IMAGE_REPOSITORY)/steampipe:$(KE_IMG_TAG) -f Dockerfile.steampipe $(PWD)

steampipe-docker-push:
	docker tag $(IMAGE_REPOSITORY)/steampipe:$(KE_IMG_TAG) $(IMAGE_REPOSITORY)/steampipe:0.20.x
	docker push $(IMAGE_REPOSITORY)/steampipe:0.20.x

docker:
	docker pull $(IMAGE_REPOSITORY)/steampipe:0.20.x
	docker tag $(IMAGE_REPOSITORY)/steampipe:0.20.x $(IMAGE_REPOSITORY)/steampipe:$(KE_IMG_TAG)
	docker build --build-arg VERSION=$(VERSION) --build-arg IMAGE_REPOSITORY=$(IMAGE_REPOSITORY) --build-arg KE_IMG_TAG=$(KE_IMG_TAG) -t $(IMAGE_REPOSITORY)/cloud-scanner:$(KE_IMG_TAG) -f Dockerfile $(PWD)

push: docker
	docker push $(IMAGE_REPOSITORY)/cloud-scanner:$(KE_IMG_TAG)
