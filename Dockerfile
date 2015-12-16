FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon.lam@virtualclouds.info>

# Add extra repo's
RUN echo "deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi" >> /etc/apt/sources.list

# Update because we added extra repo, install packages
RUN apt-get update && apt-get install -y wget python python3

# Download extra packages that can't be installed with apt-get

RUN wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/python3-rtimulib_7.2.1-3_armhf.deb \
&& wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib-dev_7.2.1-3_armhf.deb \
&& wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib-utils_7.2.1-3_armhf.deb \
&& wget -P /tmp https://github.com/remonlam/rpi-docker-weather/raw/master/packages/librtimulib7_7.2.1-3_armhf.deb
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
RUN dpkg -i /tmp/* && apt-get -f install -y && dpkg -i /tmp/*

# Clenaup to save space
#RUN apt-get clean \
#&& apt-get autoclean

# Download test python script
RUN wget -P / https://raw.githubusercontent.com/remonlam/rpi-docker-weather/master/test.py

# Make it run when container is started
CMD ["python", "/test.py"]
