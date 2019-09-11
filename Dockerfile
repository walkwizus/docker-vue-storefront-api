FROM node:10-alpine

ENV VS_ENV prod

WORKDIR /var/www

RUN apk add --no-cache curl git

COPY package.json ./

RUN apk add --no-cache --virtual .build-deps ca-certificates wget && \
    yarn install --no-cache && \
    apk del .build-deps

COPY vue-storefront-api.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/vue-storefront-api.sh

CMD ["vue-storefront-api.sh"]
