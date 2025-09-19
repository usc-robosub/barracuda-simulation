FROM ghcr.io/usc-robosub/dave-base:main

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        qtwayland5 libqt5x11extras5 \
        libxkbcommon0 libxkbcommon-x11-0 \
        libgl1-mesa-glx libglu1-mesa mesa-utils \
    && rm -rf /var/lib/apt/lists/*

ENV QT_X11_NO_MITSHM=1 GDK_BACKEND=wayland,x11

COPY . /opt/barracuda-simulation

RUN . /opt/ros/noetic/setup.sh \ 
    && cd /opt/barracuda-simulation/catkin_ws \
    && catkin build barracuda_description \
    && catkin build barracuda_simulation \
    && catkin build gate_description \
    && catkin build channel_description \
    && catkin build pool_description


# Set working directory
WORKDIR /opt

# Source the workspace on container start
CMD ["/bin/bash", "/opt/barracuda-simulation/entrypoint.sh"]
