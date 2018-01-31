FROM node:alpine

RUN apk update --no-cache \
    && apk upgrade --no-cache

RUN npm install -g --unsafe-perm node-red node-red-admin
RUN npm outdated -g
RUN npm install -g node-red

# User configuration directory volume
EXPOSE 1880

CMD ["node-red"]
