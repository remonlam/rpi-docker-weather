FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon.lam@virtualclouds.info>

# Install Python, wget and install any app dependencies.
# NOTE: the RUN line have one run command so we have one install layer instead of 4.
RUN apt-get update \
 && apt-get install -y python \
                    wget \
                    gfortran \
                    f95 \
                    ifort \
                    ifc \
                    lf95 \
                    pgfortran \
                    f90 \
                    f77 \
                    fort \
                    efort \
                    efc \
                    g77 \
                    g95 \
                    pathf95 \
 && apt-get clean \
 && apt-get autoclean
 && pip-3.2 install pillow

# Download our Node.js website from my GitHub (github.com/remonlam/docker-demo).
RUN wget -P / https://raw.githubusercontent.com/remonlam/docker-demo/master/node_web.js

EXPOSE 8080
CMD ["node", "node_web.js"]
