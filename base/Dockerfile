FROM ros:noetic-ros-base-focal

# Set ROS distribution
ARG DIST=noetic

# Set Gazebo version
ARG GAZ=gazebo11

RUN sudo apt-get update \
    && sudo apt-get install --no-install-recommends -y git vim wget \
        ${GAZ} \
        lib${GAZ}-dev \
        python3-catkin-tools \
        python3-rosdep \
        python3-rosinstall \
        python3-rosinstall-generator \
        python3-vcstool \
        ros-${DIST}-gazebo-plugins \
        ros-${DIST}-gazebo-ros \
        ros-${DIST}-gazebo-ros-control \
        ros-${DIST}-gazebo-ros-pkgs \
        ros-${DIST}-effort-controllers \
        ros-${DIST}-geographic-info \
        ros-${DIST}-hector-gazebo-plugins \
        ros-${DIST}-image-view \
        ros-${DIST}-joint-state-controller \
        ros-${DIST}-joint-state-publisher \
        ros-${DIST}-joy \
        ros-${DIST}-joy-teleop \
        ros-${DIST}-kdl-parser-py \
        ros-${DIST}-key-teleop \
        ros-${DIST}-move-base \
        ros-${DIST}-moveit-commander \
        ros-${DIST}-moveit-planners \
        ros-${DIST}-moveit-simple-controller-manager \
        ros-${DIST}-moveit-ros-visualization \
        ros-${DIST}-pcl-ros \
        ros-${DIST}-robot-localization \
        ros-${DIST}-robot-state-publisher \
        ros-${DIST}-ros-base \
        ros-${DIST}-ros-controllers \
        ros-${DIST}-rqt \
        ros-${DIST}-rqt-common-plugins \
        ros-${DIST}-rqt-robot-plugins \
        ros-${DIST}-rviz \
        ros-${DIST}-teleop-tools \
        ros-${DIST}-teleop-twist-joy \
        ros-${DIST}-teleop-twist-keyboard \
        ros-${DIST}-tf2-geometry-msgs \
        ros-${DIST}-tf2-tools \
        ros-${DIST}-urdfdom-py \
        ros-${DIST}-velodyne-gazebo-plugins \
        ros-${DIST}-velodyne-simulator \
        ros-${DIST}-xacro \
    && rm -rf /var/lib/apt/lists/*

COPY . /opt/barracuda-simulation

RUN . /opt/ros/noetic/setup.sh \ 
    && cd /opt/barracuda-simulation/catkin_ws \
    && catkin build
# Set working directory
WORKDIR /opt
