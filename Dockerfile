FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon.lam@virtualclouds.info>

# Add extra repo's
RUN apt-get update \
&& apt-get install -y wget \
&& wget https://raw.githubusercontent.com/remonlam/rpi-docker-weather/master/install.sh \
&& chmod 755 install.sh

# Download test python script
RUN wget -P / https://raw.githubusercontent.com/remonlam/rpi-docker-weather/master/test.py

# Make it run when container is started
CMD ["python", "/test.py"]
