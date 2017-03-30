#!/bin/bash
#Install Robot Operating System (ROS) on NVIDIA Jetson
# Setup Locale
sudo update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX

# Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

# Installation
sudo apt-get update
sudo apt-get  --allow-unauthenticated install ros-kinetic-ros-base -y

# Initialize rosdep
sudo apt-get  --allow-unauthenticated install python-rosdep -y
sudo c_rehash /etc/ssl/certs
sudo rosdep init

# To find available packages, use:
rosdep update
# Environment Setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc


# Install rosinstall
sudo apt-get  --allow-unauthenticated install python-rosinstall -y

######################## Install Jetson Car Dependencies ###################################
sudo apt-get  --allow-unauthenticated install gcc-avr -y
sudo apt-get  --allow-unauthenticated install arduino -y
sudo apt-get  --allow-unauthenticated install ros-kinetic-rosserial-arduino ros-kinetic-rosserial ros-kinetic-angles -y
sudo apt-get  --allow-unauthenticated install ros-kinetic-joy -y
# sudo apt-get install ros-indigo-usb-cam -y 

