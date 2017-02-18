FROM node:4

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y zip && \
    apt-get clean

ADD https://codeload.github.com/brainfoolong/rcon-web-admin/zip/master /tmp/rcon-web-admin.zip

RUN cd /tmp ; unzip /tmp/rcon-web-admin.zip && \
    mv rcon-web-admin-master /opt/rcon-web-admin && \
    rm /tmp/rcon-web-admin.zip

WORKDIR /opt/rcon-web-admin

RUN npm install && \
    node src/main.js install-core-widgets && \
    chmod 0755 -R startscripts *

# 4326: web UI
# 4327: websocket
EXPOSE 4326 4327

VOLUME ["/opt/rcon-web-admin/db"]

ENTRYPOINT ["/usr/local/bin/node", "src/main.js", "start"]
