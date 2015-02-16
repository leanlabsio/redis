FROM gliderlabs/alpine:latest

RUN apk-install redis

EXPOSE 6379

CMD ["redis-server"]
