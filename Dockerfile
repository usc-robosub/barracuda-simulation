FROM dave:latest
# FROM ghcr.io/usc-robosub/dave-base:main

COPY --chown=$USER_UID:$USER_GID catkin_ws/src/barracuda /home/ros/catkin_ws/src/barracuda
COPY entrypoint.sh /opt/barracuda-simulation/entrypoint.sh

USER $USERNAME
RUN . /opt/ros/noetic/setup.sh \
    . /home/ros/catkin_ws/devel/setup.bash \
    && cd /home/ros/catkin_ws \
    && catkin build barracuda_description \
    && catkin build barracuda_simulation \
    && catkin build gate_description
USER root

# Source the workspace on container start
CMD ["/bin/bash", "/opt/barracuda-simulation/entrypoint.sh"]

