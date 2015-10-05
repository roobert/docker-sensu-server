FROM sensu

MAINTAINER Rob Wilson <roobert@gmail.com>

ENV TRANSPORT_NAME=
ENV RABBITMQ_URL=
ENV REDIS_URL=

ENV LOG_LEVEL=info
ENV SENSU_GEMS_VERSION=2.0.0

# use embedded ruby..
ENV PATH /opt/sensu/embedded/bin:/sensu/plugins:/sensu/handlers:/sbin:/usr/sbin:/bin:/usr/bin
ENV GEM_PATH /opt/sensu/embedded/lib/ruby/gems/${SENSU_GEMS_VERSION}

# can be used to do things like install dependencies for sensu handlers/plugins
ADD dependencies.sh /tmp/
RUN bash /tmp/dependencies.sh

COPY data/* /sensu/

CMD /opt/sensu/embedded/bin/sensu-server \
  --config_dir /sensu/conf.d \
  --extension_dir /sensu/extensions \
  --log_level $LOG_LEVEL
