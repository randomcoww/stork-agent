FROM alpine:latest

RUN set -x \
  \
  && apk add --no-cache --virtual .build-deps \
    bash \
    curl \
  \
  && curl -1sLf \
    'https://dl.cloudsmith.io/public/isc/stork-dev/rsa.BF2C56ECBA97B498.key' > /etc/apk/keys/stork-dev@isc-BF2C56ECBA97B498.rsa.pub \
  && curl -1sLf \
    'https://dl.cloudsmith.io/public/isc/stork-dev/config.alpine.txt?distro=alpine&codename=v3.8' >> /etc/apk/repositories \
  && apk update \
  && apk del .build-deps \
  && apk add --no-cache \
    isc-stork-agent

ENTRYPOINT ["stork-agent"]