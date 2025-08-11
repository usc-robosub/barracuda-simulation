# barracuda-simulation

**GUI On Wayland/XWayland**
- Requirements: host has a Wayland session (or X11), Docker Compose v2, and optionally NVIDIA Container Toolkit for GPU.
- No Xauthority is required. The container auto-detects Wayland vs X11 and sets `QT_QPA_PLATFORM` accordingly.
- XWayland: ensure `DISPLAY` is set and `/tmp/.X11-unix` exists on the host. If access is denied, run `xhost +local:` once on the host.
- Wayland: ensure `WAYLAND_DISPLAY` and `XDG_RUNTIME_DIR` are set in the session. Compose mounts `${XDG_RUNTIME_DIR}` into the container.

**Run With Compose**
- XWayland and Wayland sockets are already mounted in `docker-compose.yml`.
- The service runs as your user and adds GPU access groups by GID.
- Start: `docker compose up --build`
- Optional (only if your host uses non‑standard group IDs):
  - `export VIDEO_GID=$(getent group video | cut -d: -f3)`
  - `export RENDER_GID=$(getent group render | cut -d: -f3)`
  - Defaults are `VIDEO_GID=44`, `RENDER_GID=109`. If these match your system (common), no exports are needed.

**NVIDIA GPU (optional)**
- Install NVIDIA drivers and NVIDIA Container Toolkit on the host.
- `docker-compose.yml` includes `gpus: all` and NVIDIA env so Gazebo can use the GPU.
- If you see permission issues on `/dev/dri`, verify `VIDEO_GID` and `RENDER_GID` exports above.

**Troubleshooting**
- No window: verify `DISPLAY` (XWayland) or `WAYLAND_DISPLAY`/`XDG_RUNTIME_DIR` (Wayland) exist on the host.
- Access denied on X: run `xhost +local:` on the host.
- Force backend: set `QT_QPA_PLATFORM=wayland` (Wayland) or leave default to prefer XWayland.
