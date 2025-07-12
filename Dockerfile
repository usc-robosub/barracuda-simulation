
FROM ros:noetic-ros-base-focal

COPY . /opt/barracuda-simulation

RUN apt-get update && apt-get install -y \
    locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*
ENV LANG=en_US.UTF-8

RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y tzdata \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration \
    && apt-get install -y git \
    vim \
    build-essential cmake cppcheck curl git gnupg libeigen3-dev libgles2-mesa-dev lsb-release pkg-config protobuf-compiler python3-dbg python3-pip python3-venv qtbase5-dev ruby software-properties-common sudo wget \
    && rm -rf /var/lib/apt/lists/*

ARG DIST=noetic
ARG GAZ=gazebo11
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros1-latest.list' \ 
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
    && sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' \
    && wget https://packages.osrfoundation.org/gazebo.key -O - |  apt-key add - \
    && apt-get update \
    && apt-get install -y ${GAZ} lib${GAZ}-dev python3-catkin-tools python3-rosdep python3-rosinstall python3-rosinstall-generator python3-vcstool ros-${DIST}-gazebo-plugins ros-${DIST}-gazebo-ros ros-${DIST}-gazebo-ros-control ros-${DIST}-gazebo-ros-pkgs ros-${DIST}-effort-controllers ros-${DIST}-geographic-info ros-${DIST}-hector-gazebo-plugins ros-${DIST}-image-view ros-${DIST}-joint-state-controller ros-${DIST}-joint-state-publisher ros-${DIST}-joy ros-${DIST}-joy-teleop ros-${DIST}-kdl-parser-py ros-${DIST}-key-teleop ros-${DIST}-move-base ros-${DIST}-moveit-commander ros-${DIST}-moveit-planners ros-${DIST}-moveit-simple-controller-manager ros-${DIST}-moveit-ros-visualization ros-${DIST}-pcl-ros ros-${DIST}-robot-localization ros-${DIST}-robot-state-publisher ros-${DIST}-ros-base ros-${DIST}-ros-controllers ros-${DIST}-rqt ros-${DIST}-rqt-common-plugins ros-${DIST}-rqt-robot-plugins ros-${DIST}-rviz ros-${DIST}-teleop-tools ros-${DIST}-teleop-twist-joy ros-${DIST}-teleop-twist-keyboard ros-${DIST}-tf2-geometry-msgs ros-${DIST}-tf2-tools ros-${DIST}-urdfdom-py ros-${DIST}-velodyne-gazebo-plugins ros-${DIST}-velodyne-simulator ros-${DIST}-xacro \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install -U vcstool \
    && pip3 install -U catkin_tools \
    && . /opt/ros/noetic/setup.sh \
    && cd /opt/barracuda-simulation/catkin_ws \
    && catkin build


    
WORKDIR /opt

CMD ["/bin/bash", "/opt/barracuda-simulation/entrypoint.sh"]