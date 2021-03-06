#!/bin/bash

## This script is used in the Dockerfile to install software packages.
# Enable extra repo's
echo "deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi" >> /etc/apt/sources.list

# Update because we added extra repo, install packages
apt-get update \
&& apt-get install -y wget \
                      python \
                      python3 \
                      libwebp5 \
                      libjbig0 \
                      libfreetype6 \
                      libjpeg62-turbo \
                      liblcms2-2 \
                      libtiff5 \
                      libblas-common \
                      libgfortran3 \
                      libblas3 \
                      liblapack3 \
                      python-numpy \
                      python3-numpy

# Download extra packages that can't be installed with apt-get
wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-rtimulib_7.2.1-3_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib-dev_7.2.1-3_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib-utils_7.2.1-3_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib7_7.2.1-3_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/libwebpdemux1_0.4.1-1.2_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/libwebpmux1_0.4.1-1.2_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python-pil_2.6.1-2_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python-rtimulib_7.2.1-3_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python-sense-hat_2.1.0-1_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-pil_2.6.1-2_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-rtimulib_7.2.1-3_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-sense-hat_2.1.0-1_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/raspberrypi-bootloader_1.20151118-1_armhf.deb \
 && wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/sense-hat_1.2_all.deb

# Install the downloaded packages, fix dependencies, reinstalled last packages
dpkg -i /tmp/python3-rtimulib_7.2.1-3_armhf.deb \
            /tmp/librtimulib7_7.2.1-3_armhf.deb \
            /tmp/python3-rtimulib_7.2.1-3_armhf.deb \
            /tmp/librtimulib-dev_7.2.1-3_armhf.deb \
            /tmp/librtimulib-utils_7.2.1-3_armhf.deb \
            /tmp/librtimulib7_7.2.1-3_armhf.deb \
            /tmp/libwebpdemux1_0.4.1-1.2_armhf.deb \
            /tmp/libwebpmux1_0.4.1-1.2_armhf.deb \
            /tmp/python-pil_2.6.1-2_armhf.deb \
            /tmp/python-rtimulib_7.2.1-3_armhf.deb \
            /tmp/python-sense-hat_2.1.0-1_armhf.deb \
            /tmp/python3-pil_2.6.1-2_armhf.deb \
            /tmp/python3-rtimulib_7.2.1-3_armhf.deb \
            /tmp/python3-sense-hat_2.1.0-1_armhf.deb \
            /tmp/raspberrypi-bootloader_1.20151118-1_armhf.deb \
            /tmp/sense-hat_1.2_all.deb

# Clenaup to save space
rm -rf /tmp/*.dep
#apt-get clean \
#&& apt-get autoclean

exit 0
