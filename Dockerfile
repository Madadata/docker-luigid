FROM phusion/baseimage:0.9.19

CMD ["/sbin/my_init"]

RUN apt-get update && \
  apt-get install -y build-essential python python-dev python-pip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir /etc/luigi
ADD client.cfg /etc/luigi/client.cfg

VOLUME /etc/luigi/client.cfg

EXPOSE 8082

CMD ["/usr/local/bin/luigid"]
