# Barracuda Simulation Package

This package contains simulation launch files and world configurations for the Barracuda AUV robosub simulation.

## Package Structure

```
barracuda_simulation/
├── launch/
│   ├── robosub_world.launch    # Complete simulation with robot and gate
│   ├── barracuda_only.launch   # Robot-only simulation
│   └── gate_only.launch        # Gate-only simulation for testing
├── worlds/                     # Custom world files (future use)
├── package.xml
├── CMakeLists.txt
└── README.md
```

## Launch Files

### `robosub_world.launch`
Complete robosub simulation environment including:
- Barracuda AUV robot
- Competition gate obstacle
- Ocean environment with seafloor
- Joystick control

**Usage:**
```bash
roslaunch barracuda_simulation robosub_world.launch
```

**Key Arguments:**
- `robot_x`, `robot_y`, `robot_z`: Robot spawn position (default: 25, 0, -85)
- `gate_x`, `gate_y`, `gate_z`: Gate spawn position (default: 50, 0, -85)
- `gui`: Show Gazebo GUI (default: true)
- `joy_id`: Joystick device ID (default: 0)

### `barracuda_only.launch`
Robot-only simulation for development and testing.

**Usage:**
```bash
roslaunch barracuda_simulation barracuda_only.launch
```

### `gate_only.launch`
Gate-only simulation for obstacle testing.

**Usage:**
```bash
roslaunch barracuda_simulation gate_only.launch
```

## Dependencies

This package depends on:
- `barracuda_description`: Robot description package
- `gate_description`: Gate obstacle description package
- `dave_worlds`: UUV simulation worlds
- `dave_nodes`: UUV simulation nodes
- `uuv_assistants`: UUV simulation helpers

## Quick Start

1. Build the workspace:
   ```bash
   cd /home/takatoshi/Github/robosub/barracuda-simulation
   catkin_make
   source devel/setup.bash
   ```

2. Launch the complete simulation:
   ```bash
   roslaunch barracuda_simulation robosub_world.launch
   ```

3. Control the robot with a joystick or use ROS topics for autonomous control.
