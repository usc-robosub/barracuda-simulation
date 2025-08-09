#!/bin/bash
set -euo pipefail

# Ensure a writable HOME before any use of ~/. files
if [ -z "${HOME:-}" ] || [ "${HOME}" = "/" ] || [ ! -w "${HOME}" ]; then
  export HOME=/tmp/home
fi
mkdir -p "${HOME}"

source /opt/ros/noetic/setup.bash
source /opt/barracuda-simulation/catkin_ws/devel/setup.bash

# Prepare ROS logging dirs
mkdir -p "${HOME}/.ros/log"
export ROS_HOME="${HOME}/.ros"
export ROS_LOG_DIR="${ROS_HOME}/log"

# Prefer XWayland/X11 if DISPLAY and X socket are available; else try Wayland
if [ -n "${DISPLAY:-}" ] && [ -d /tmp/.X11-unix ] && ls /tmp/.X11-unix/* >/dev/null 2>&1; then
  export QT_QPA_PLATFORM=xcb
elif [ -n "${WAYLAND_DISPLAY:-}" ]; then
  if [ -n "${XDG_RUNTIME_DIR:-}" ] && [ -S "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" ]; then
    export QT_QPA_PLATFORM=wayland
  elif [ -S "/tmp/${WAYLAND_DISPLAY}" ]; then
    export XDG_RUNTIME_DIR=/tmp
    export QT_QPA_PLATFORM=wayland
  fi
fi

# Fallback to X11 if nothing detected (safer for Gazebo)
export QT_QPA_PLATFORM=${QT_QPA_PLATFORM:-xcb}

# Avoid potential X11 shared memory issues inside containers
export QT_X11_NO_MITSHM=${QT_X11_NO_MITSHM:-1}

# Prefer NVIDIA GLX if GPUs are exposed via NVIDIA runtime
if [ -n "${NVIDIA_VISIBLE_DEVICES:-}" ] && [ "${NVIDIA_VISIBLE_DEVICES}" != "void" ]; then
  export __GLX_VENDOR_LIBRARY_NAME=${__GLX_VENDOR_LIBRARY_NAME:-nvidia}
fi

# Ensure localhost entries exist (idempotent)
if [ "$(id -u)" = "0" ]; then
  grep -qxF "127.0.0.1 localhost" /etc/hosts || echo "127.0.0.1 localhost" >> /etc/hosts
fi

exec roslaunch barracuda_simulation robosub_world.launch
