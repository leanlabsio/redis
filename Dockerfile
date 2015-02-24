FROM gliderlabs/alpine:latest

RUN apk-install redis

EXPOSE 6379

ADD ./build.sh /tmp/build.sh

ENTRYPOINT ["/bin/sh", "/tmp/build.sh"]

VOLUME ["/data"]

CMD ["redis-server","/etc/redis.conf"]
