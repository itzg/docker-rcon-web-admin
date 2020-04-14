
[![Docker Pulls](https://img.shields.io/docker/pulls/itzg/rcon)](https://hub.docker.com/r/itzg/rcon)

This image lets you run the [rcon-web-admin](https://github.com/lacaulac/rcon-web-admin) administration tool as a
Docker container. A great benefit of running rcon-web-admin in Docker, especially
in a Docker Composition is that the RCON port of your game server
can remain securely isolated within the Docker network.

## Getting Started

To get up and running quickly, use

```
docker run -d -p 4326:4326 -p 4327:4327 itzg/rcon
```

With that you can follow the [regular instructions](https://github.com/brainfoolong/rcon-web-admin#open-in-browser) and
access the web UI at http://YOUR_DOCKER_HOST:4326

## Options

### VOLUMEs

* /opt/rcon-web-admin/db

### PORTs

* 4326 : web UI
* 4327 : websocket access from UI

## Examples

### Running with itzg/minecraft-server

To run this with the itzg/minecraft-server image, simply download/modify
[this docker-compose.yml](https://raw.githubusercontent.com/itzg/dockerfiles/master/minecraft-server/docker-compose.yml)
and then use `docker-compose` or `docker stack deploy -c` to bring up the composition.

With that particular composition, configure a new server as shown here (with an RCON password of "testing")

![](https://i.imgur.com/qTrwkaO.png)

With the server configured, go to the Dashboard and pick the server "minecraft". The following
shows adding a "Console" widget and running the "help" command against Minecraft: 

![](https://i.imgur.com/UYr7I7C.png)
