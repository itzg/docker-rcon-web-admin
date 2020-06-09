FROM node:10

ARG RCON_WEB_ADMIN_VERSION=0.14.1

ADD https://github.com/rcon-web-admin/rcon-web-admin/archive/${RCON_WEB_ADMIN_VERSION}.tar.gz /tmp/rcon-web-admin.tgz

RUN tar -C /opt -xf /tmp/rcon-web-admin.tgz && \
    rm /tmp/rcon-web-admin.tgz && \
    ln -s /opt/rcon-web-admin-${RCON_WEB_ADMIN_VERSION} /opt/rcon-web-admin

WORKDIR /opt/rcon-web-admin

RUN npm install && \
    node src/main.js install-core-widgets && \
    chmod 0755 -R startscripts *

# 4326: web UI
# 4327: websocket
EXPOSE 4326 4327

VOLUME ["/opt/rcon-web-admin/db"]

ENTRYPOINT ["/usr/local/bin/node", "src/main.js", "start"]
