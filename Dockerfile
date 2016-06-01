#
# This Dockerfile will be build to create Docker image
#
FROM ubuntu:14.04
MAINTAINER Shaun Thomas <shaunthomas999@gmail.com>

ENV REFRESHED_AT "2016-05-30:17-18"

RUN apt-get -y update

# Install required generic packages
RUN apt-get install -y curl

# Install NodeJS
# - Ref: https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup_4.x | -E bash -
RUN apt-get install -y nodejs

# Install SlimerJS - 0.9.6
# a) install package
RUN wget http://download.slimerjs.org/releases/0.9.6/slimerjs-0.9.6-linux-x86_64.tar.bz2
RUN tar -xjvf slimerjs-0.9.6-linux-x86_64.tar.bz2
RUN mv slimerjs-0.9.6 /opt/
RUN ln -sf /opt/slimerjs-0.9.6/slimerjs /usr/local/bin/slimerjs

# b) install firefox
RUN wget ftp.mozilla.org/pub/firefox/releases/36.0.4/linux-x86_64/en-US/firefox-36.0.4.tar.bz2
RUN tar -xjvf firefox-36.0.4.tar.bz2
RUN mv firefox /opt/firefox-36.0.4
RUN ln -sf /opt/firefox-36.0.4/firefox /usr/bin/firefox

# c) install xvfb - X Virtual FrameBuffer
RUN apt-get install xvfb
RUN apt-get install xfonts-100dpi xfonts-75dpi xfonts-cyrillic xorg dbus-x11

# Install PhatomJS - 1.9.20
RUN apt-get install -y libfontconfig
RUN npm install -g phantomjs@1.9.20

# Install CasperJS - 1.1.1
RUN npm install -g casperjs@1.1.1