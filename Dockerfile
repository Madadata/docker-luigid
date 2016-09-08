FROM phusion/baseimage:0.9.19

RUN apt-get update && \
  apt-get install -y \
    build-essential \
    python3 \
    python-dev \
    python-pip \
    libpq-dev \
    && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir /etc/luigi
ADD client.cfg /etc/luigi/client.cfg

EXPOSE 8082

CMD ["/sbin/my_init", "/usr/local/bin/luigid"]
