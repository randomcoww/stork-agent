FROM alpine:latest

RUN set -x \
  \
  && apk add --no-cache --virtual .build-deps \
    bash \
    curl \
  \
  && curl -1sLf \
    'https://dl.cloudsmith.io/public/isc/stork-dev/setup.alpine.sh' | bash \
  \
  && apk del .build-deps \
  && apk add --no-cache \
    isc-stork-agent

ENTRYPOINT ["stork-agent"]