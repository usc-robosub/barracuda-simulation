FROM ghcr.io/usc-robosub/dave-base:main

COPY . /opt/barracuda-simulation

RUN . /opt/ros/noetic/setup.sh \ 
    && cd /opt/barracuda-simulation/catkin_ws \
    && catkin build

# Set working directory
WORKDIR /opt

# Source the workspace on container start
CMD ["/bin/bash", "/opt/barracuda-simulation/entrypoint.sh"]
