FROM nodered/node-red:1.0.2
MAINTAINER Eric Firestone <@firetweet>

RUN npm install -no-cache node-red-contrib-home-assistant-websocket
