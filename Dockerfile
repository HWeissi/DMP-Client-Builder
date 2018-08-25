FROM mono:latest

MAINTAINER Weissteiner Hannes <h.weissteiner@gmail.com>

WORKDIR /home/builder

RUN apt-get update && apt-get -y install git && git clone https://github.com/godarklight/DarkMultiPlayer.git

COPY ./build.sh /opt/scripts/build.sh

## TODO CRON settings

CMD crond && tail -f /var/log/build.log

