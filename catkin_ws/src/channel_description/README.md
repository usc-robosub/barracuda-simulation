# Channel Description Package

This package contains the URDF description and 3D models for the RoboSub competition channel obstacle.

## Package Contents

- `urdf/channel.urdf`: URDF description of the channel
- `meshes/`: Directory for 3D mesh files (DAE format)
- `launch/display.launch`: Launch file for displaying the channel in RViz
- `launch/gazebo.launch`: Launch file for spawning the channel in Gazebo

## Usage

### Display in RViz
```bash
roslaunch channel_description display.launch
```

### Spawn in Gazebo
```bash
roslaunch channel_description gazebo.launch
```

## Notes

- The mesh file `channel.dae` should be placed in the `meshes/` directory
- The channel is set as a static object in Gazebo simulation
- Inertial properties can be adjusted based on the actual channel dimensions and material
