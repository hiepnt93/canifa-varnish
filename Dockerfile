FROM alpine
MAINTAINER  hiepnt93

ENV DEBIAN_FRONTEND noninteractive

# Make our custom VCLs available on the container

# Export environment variables
ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_BACKEND_HOST 0.0.0.0
ENV VARNISH_PORT 80

ENV VARNISH_BACKEND_HOST localhost
ENV VARNISH_BACKEND_PORT 80

ENV VARNISH_THREAD_POOLS 25
ENV VARNISH_THREAD_POOL_MIN 100
ENV VARNISH_CLI_TIMEOUT 86400
ENV VARNISH_STORAGE 1G

ENV VARNISH_SECRET=007


RUN set -ex \
      && apk update \
      && apk add \
        bash \
        varnish \
        nano \
        git

ADD default.vcl /etc/varnish/default.vcl

# Expose port 80
EXPOSE 80
EXPOSE 6082

ADD start.sh /start.sh
CMD ["/start.sh"]
