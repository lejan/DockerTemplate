# DockerTemplate
A simple template to use Docker.
In this repo the base image has Ubuntu Bionic full desktop version, ROS Melodic and Gazebo 9.

## Build
First of all you need to create the docker image based on the docker file.
```bash
make build
```

## Usage
Now you can instantiate a container and run it every time you want.
```bash
make run
```

## Configuring
There are 4 main files to be modified:
* Dockerfile
* Dockerfile.nvidia
* build.sh
* run.sh

### Dockerfile
Choose the base image of your preference and modify the rest accordingly.
For example:

```FROM  osrf/ros:melodic-desktop-full```

### Dockerfile.nvidia
In the second line you must specify your_docker_image_name.

```FROM your_docker_image_name```

For example:

```FROM bionic_melodic_gaz9_turtlebot3```

### build.sh
Name the docker image.

```TAG_DOCKER_IMAGE="your_docker_image_name"```

For example:

```TAG_DOCKER_IMAGE="bionic_melodic_gaz9_turtlebot3"```

And if you want nvidia support.

```TAG_DOCKER_IMAGE_NVIDIA="your_nvidia_docker_image_name"```

For example:

```TAG_DOCKER_IMAGE_NVIDIA="bionic_melodic_gaz9_turtlebot3_nvidia"```

### run.sh
Here you must specify the docker image to be run. Wethere the nvida version or not.

```docker="your_docker_image_name"```

or

```docker="your_nvidia_docker_image_name"```

For example:

```docker="bionic_melodic_gaz9_turtlebot3_nvidia"```
