# Dockerized Tor Relay Node on Raspberry Pi
#
# VERSION               0.0.1

FROM resin/rpi-raspbian
MAINTAINER Andrew Schamp "schamp@gmail.com"

# Install Tor
RUN apt-get update && apt-get -y install tor && apt-get clean

# Expose the main port
EXPOSE 9001

# Add a user
RUN useradd tor

# This is where the tor data is stored
VOLUME /home/tor/.tor

# Add launcher
ADD start.sh /start.sh

# Start Tor
CMD /start.sh
