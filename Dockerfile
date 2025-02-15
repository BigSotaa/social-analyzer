FROM node:18.15.0-alpine3.17

# Install Python and autopep8
RUN apk update && \
    apk add --no-cache python3 py3-pip && \
    pip3 install autopep8

WORKDIR /usr/src/app
COPY . .
RUN apk add --no-cache firefox-esr && \
    npm ci && \
    npm install lodash && \
    npm install --loglevel=error

EXPOSE 9005
ENTRYPOINT [ "npm", "start", "--","--docker"]
