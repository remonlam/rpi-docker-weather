#Create a Weather Station on you're Raspberry Pi with the Sense-Hat.

This Python based weather station runs inside a Docker container :-)


### To run the "pre-build" script just execute this line, if you run the Dockerfile make sure you change the image name
docker run -d --privileged=true remonlam/rpi-docker-weather

### To run you're own script you could mount /docker-data from the host to the container and execute "python /data/script.py"
docker run -d --privileged=true -v /docker-data:/data remonlam/rpi-docker-weather python /data/[script].py
