#!/bin/bash

TAG_DOCKER_IMAGE="bionic_melodic_gaz9_turtlebot3"
TAG_DOCKER_IMAGE_NVIDIA="bionic_melodic_gaz9_turtlebot3_nvidia"

docker build --build-arg uid=$(id -u) --tag $TAG_DOCKER_IMAGE . -f "$(pwd)/Dockerfile"
docker build -t $TAG_DOCKER_IMAGE_NVIDIA . -f "$(pwd)/Dockerfile.nvidia"
