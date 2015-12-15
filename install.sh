#!/bin/bash

# Added all the RPI repos
echo "deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi" >> /etc/apt/sources.list

# Update repo and install packages
apt-get update && \
apt-get install -y nano \
                wget \
                ssh \
                python \
                python3

# Download source packages
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-rtimulib_7.2.1-3_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib-dev_7.2.1-3_armhf.deb /
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib-utils_7.2.1-3_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib7_7.2.1-3_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/libwebpdemux1_0.4.1-1.2_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/libwebpmux1_0.4.1-1.2_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python-pil_2.6.1-2_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python-rtimulib_7.2.1-3_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python-sense-hat_2.1.0-1_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-pil_2.6.1-2_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-rtimulib_7.2.1-3_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-sense-hat_2.1.0-1_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/raspberrypi-bootloader_1.20151118-1_armhf.deb
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/sense-hat_1.2_all.deb

# Installing packages
dpkg -i /tmp/*

# Finish installing dependencies
apt-get -f install -y

#docker run -it -privileged remonlam/rpi-rasbian:jessie bash
#docker run -it --privileged remonlam/rpi-rasbian:jessie bash
