# barracuda-simulation

## Running the Simulator on an Apple Silicon Mac

1. Install UTM from [https://mac.getutm.app/](https://mac.getutm.app/).
2. Download Ubuntu 20.04 64-bit ARM (ARMv8/AArch64) server install image from [https://cdimage.ubuntu.com/releases/focal/release/](https://cdimage.ubuntu.com/releases/focal/release/).
3. Create a new Linux VM in UTM (virtualize) with that image.
4. At the "Guided storage configuration" step, make sure the "Set up this disk as an LVM group" box is **not** ticked (it will be by default).
5. After installation is complete you'll see a blinking cursor. Force power off the VM with the power icon, then go to the VM settings and drag VirtIO drive above USB drive in the Drives section.
6. Set the display device to virtio-gpu-gl-pci (GPU Supported). Then start the VM. 
7. Log in and run ([https://docs.getutm.app/guides/ubuntu/](https://docs.getutm.app/guides/ubuntu/)): 

```other
sudo apt update
sudo apt install ubuntu-desktop
sudo reboot
```



### Inside VM

1. Follow the steps on this page: [Directly on Host](https://field-robotics-lab.github.io/dave.doc/contents/installation/Install-Directly-on-Host/)

2. Clone this repo (then run git submodule init and git submodule update), cd barracuda-simulation/catkin_ws
3. Run catkin build
4. Run source devel/setup.bash
5. Run roslaunch barracuda_description barracuda_gazebo.launch

Note: you will need to set up git credentials and ssh key
