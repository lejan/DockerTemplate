FROM  osrf/ros:melodic-desktop-full
LABEL maintainer="lejan"

ARG user="lejan"
ARG uid="1000"

# Setup environment
ENV ROS_DISTRO=melodic
# ENV GZ_VERSION=7

USER root

# Setup environment
RUN apt-get update
# RUN apt-get upgrade -y
RUN apt-get install -y locales gnupg2
RUN locale-gen en_US.UTF-8
ENV \
    LANG=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# Create a user with passwordless sudo
RUN adduser --disabled-password --gecos "Development User"  -u ${uid} ${user}
RUN adduser ${user} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#USER ${USER}
USER ${user}

# Automatically source ROS workspace
RUN echo ". /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/${user}/.bashrc
ENV CATKIN_WS_DIR "/catkin_ws"
ENV CATKIN_SETUP_BASH "${CATKIN_WS_DIR}/devel/setup.bash"
RUN echo "[[ -f ${CATKIN_SETUP_BASH} ]] && . ${CATKIN_SETUP_BASH}" >> /home/${user}/.bashrc

USER root

RUN apt-get install tmux -y
RUN apt-get install gdal-bin -y
RUN apt-get install libgdal-dev -y

RUN apt-get install -y ros-melodic-joy ros-melodic-teleop-twist-joy \
  ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc \
  ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan \
  ros-melodic-rosserial-arduino ros-melodic-rosserial-python \
  ros-melodic-rosserial-server ros-melodic-rosserial-client \
  ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server \
  ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro \
  ros-melodic-compressed-image-transport ros-melodic-rqt* \
  ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers

RUN apt-get install ros-melodic-dynamixel-sdk -y
RUN apt-get install ros-melodic-turtlebot3-msgs -y
RUN apt-get install ros-melodic-turtlebot3 -y
RUN apt-get install ros-melodic-turtlebot3-gazebo -y

# RUN apt-get install ros-noetic-ros-control -y
# RUN apt-get install ros-noetic-controller-manager -y
# RUN apt-get install ros-noetic-effort-controllers -y
# RUN apt-get install ros-noetic-turtlebot3 -y
# RUN apt-get install ros-noetic-turtlebot3-gazebo -y

# RUN apt-get install software-properties-common --fix-missing -y
# RUN add-apt-repository ppa:inkscape.dev/stable-1.1
# RUN apt-get update
# RUN apt install inkscape --fix-missing -y

# RUN apt-get update
# RUN apt-get upgrade -y

# Workspace
RUN mkdir -p /catkin_ws/src/ && \
    chown -R ${user} /catkin_ws

USER ${user}
WORKDIR /catkin_ws/
RUN rosdep update
# RUN sudo ln -s /usr/bin/python3 /usr/bin/python

# RUN catkin_make
# RUN source devel/setup.bash

# RUN echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
# RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make'
# RUN echo "source /home/catkin_ws/devel/setup.bash" >> ~/.bashrc
