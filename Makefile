.DEFAULT_GOAL := all

CUR := $(shell pwd)
OS := $(shell uname)
VERSION := $(shell cat ${CUR}/VERSION)
IMAGE_REPO := aws-dax-go-sample
IMAGE_TAG := ${VERSION}
REGISTORY := docker.io
DOCKER_ACCOUNT := yoichikawasaki

all: docker-build

docker-build:
	set -x
	export DOCKER_BUILDKIT=1
	docker build -t ${IMAGE_REPO}:${IMAGE_TAG} . --target executor

docker-push:
	docker login --username ${DOCKER_ACCOUNT}
	docker tag ${IMAGE_REPO}:${IMAGE_TAG} ${REGISTORY}/${DOCKER_ACCOUNT}/${IMAGE_REPO}:${IMAGE_TAG}
	docker push ${REGISTORY}/${DOCKER_ACCOUNT}/${IMAGE_REPO}:${IMAGE_TAG}
