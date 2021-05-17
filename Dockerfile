FROM alpine:3.7
RUN apk add --no-cache bash curl
RUN apk add jo --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

WORKDIR /app

COPY appendhook.sh .

ENV WEBHOOK_URL=none

CMD ["bash", "-c", "./appendhook.sh $WEBHOOK_URL"]