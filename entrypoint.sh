#!/usr/bin/bash
source /opt/ros/noetic/setup.bash
source /home/ros/catkin_ws/devel/setup.bash

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "source /home/ros/catkin_ws/devel/setup.bash" >> ~/.bashrc

roslaunch barracuda_simulation robosub_world.launch