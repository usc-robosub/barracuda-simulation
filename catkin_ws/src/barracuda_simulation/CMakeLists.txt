cmake_minimum_required(VERSION 3.0.2)
project(barracuda_simulation)

catkin_package()

# Check that all launch files are valid
roslaunch_add_file_check(launch)
