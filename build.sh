#!/bin/bash

DOCKER_PATH="docker_gazebo"
TAG_DOCKER_IMAGE="bionic_melodic_gaz9_turtlebot3"
TAG_DOCKER_IMAGE_NVIDIA="bionic_melodic_gaz9_turtlebot3_nvidia"

cd $DOCKER_PATH

docker build --build-arg uid=$(id -u) --tag $TAG_DOCKER_IMAGE . -f "$(pwd)/Dockerfile"
docker build -t $TAG_DOCKER_IMAGE_NVIDIA . -f "$(pwd)/Dockerfile.nvidia"
