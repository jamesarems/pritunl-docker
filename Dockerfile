#Creating Images for PRITUNL web vpn service 
FROM ubuntu
MAINTAINER James PS <jamesarems@gmail.com>

#Updating Ubuntu packages
RUN apt-get update
RUN apt-get -y install python-software-properties
RUN apt-get -y install software-properties-common

#Adding pritunl repository
RUN add-apt-repository -y ppa:pritunl
RUN apt-get update

#Installing Pritunl
RUN apt-get -y install pritunl
COPY start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

#Exposing 1194 udp tcp ports
EXPOSE 1194/udp
EXPOSE 1194

#Exposing Web gui port
EXPOSE 9700
#ENTRYPOINT ["start.sh"]
