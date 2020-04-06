FROM ubuntu:16.04
COPY dhrystone-v2.0.tar.gz /tmp/
COPY sources.list /etc/apt/
RUN apt-get update \
 && apt-get install -y --allow-unauthenticated make gcc \
 && tar -xf /tmp/dhrystone-v2.0.tar.gz -C /root/ \
 && cd /root/dhrystone-v2.0/ && make \
 && mv dry2 /root/ && rm -rf dhrystone-v2.0/ \
 && apt-get purge -y --auto-remove make gcc \
 && rm -rf /var/lib/apt/lists/* \
 && rm /tmp/dhrystone-v2.0.tar.gz
# cd /root/ && ./dry2
