apt-get update
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# if you haven't already installed curl
apt-get install -y curl 
curl -s https://raw.githubusercontent.com/ros/noetic/master/ros.asc | sudo apt-key add -
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
apt install -y ros-noetic-desktop-full
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

apt-get install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
rosdep init
rosdep update
cd ~
echo "alias cs='cd ~/catkin_ws/src' " >> ~/.bashrc
echo "alias cm='cd ~/catkin_ws && catkin_make' " >> ~/.bashrc
echo "alias sb='source ~/catkin_ws/devel/setup.bashrc' " >> ~/.bashrc
#source ~/.bashrc
mkdir -p catkin_ws/src
cd ~/catkin_ws
/bin/bash -c "source /root/catkin_ws/devel/setup.bash"
catkin_make
source /root/catkin_ws/devel/setup.bash
