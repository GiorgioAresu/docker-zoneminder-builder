FROM phusion/baseimage:0.9.19

MAINTAINER Giorgio Aresu <giorgioaresu@gmail.com>

ENV BRANCH master

WORKDIR /tmp

ARG DEBIAN_FRONTEND=noninteractive

CMD ["/sbin/my_init"]

RUN \
# Update base image
    apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
# Update and install packages
    apt-get update && \
    apt-get install -y \
        git \
        sudo \
        wget \
    && \

# Compile zoneminder from source and install it
    wget https://raw.githubusercontent.com/ZoneMinder/ZoneMinder/master/utils/do_debian_package.sh && \
    chmod a+x do_debian_package.sh && \
    yes '' | ./do_debian_package.sh `lsb_release -a 2>/dev/null | grep Codename | awk '{print $2}'` `date +%Y%m%d`01 local $BRANCH && \
    mkdir /deb && \
    mv *.deb /deb/ && \

# Cleanup
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

