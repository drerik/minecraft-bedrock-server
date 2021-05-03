# Minecraft bedrock server container

Minecraft bedrock edition server in a container.

## Deployment

```bash
docker pull drerik/minecraft-bedrock-server
docker run -p 19132:19132/udp -p 43432:43432 --name minecraft -d drerik/minecraft-bedrock-server 
```

## Persistand deployment

To keep the server persistant over redeployments, you need to make the following files persistant

```plain
server.properties
whitelist.json
permissions.json
behavior_packs/
resource_packs/
worlds/
```

First extract the default server files from the container and create empty folders ( The container will populate them when it starts ).

```bash
mkdir /srv/minecraft
cd /srv/minecraft
sudo docker run -it --rm drerik/minecraft-bedrock-server cat /srv/server.properties | tee server.properties
sudo docker run -it --rm drerik/minecraft-bedrock-server cat /srv/whitelist.json | tee whitelist.json
sudo docker run -it --rm drerik/minecraft-bedrock-server cat /srv/permissions.json | tee permissions.json
mkdir behavior_packs resource_packs worlds
```

Then Run the container and mount the files and folders as volumes.

```bash
sudo docker pull drerik/minecraft-bedrock-server
sudo docker run \
    -p 19132:19132/udp \
    -p 43432:43432 \
    --name minecraft \
    -v /srv/minecraft/server.properties:/srv/server.properties \
    -v /srv/minecraft/whitelist.json:/srv/whitelist.json \
    -v /srv/minecraft/permissions.json:/srv/permissions.json \
    -v /srv/minecraft/behavior_packs:/srv/behavior_packs \
    -v /srv/minecraft/resource_packs:/srv/resource_packs \
    -v /srv/minecraft/worlds:/srv/worlds \
    -d drerik/minecraft-bedrock-server 
```