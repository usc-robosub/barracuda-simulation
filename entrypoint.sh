#!/usr/bin/bash
# source /opt/ros/noetic/setup.bash

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "source /opt/barracuda-simulation/catkin_ws/devel/setup.bash" >> ~/.bashrc

roslaunch barracuda_simulation barracuda_gazebo.launch


