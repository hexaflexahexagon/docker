# Minecraft Server

## Notes

- Hosts a minecraft server on localhost:25565
- TODO: maybe try and limit init ram because it locks up my entire PC lol
- TODO: change rcon password
- TODO: investigate IP helper eating the port before WSL gets there

## Commands

Bring up
```
docker-compose up -d
```

Log in:
```
# Bash
docker exec -it minecraft_mc_1 /bin/bash

# Rcon
docker exec -i mc rcon-cli

```

Proxy port on windows machine when using WSL:
```
netsh interface portproxy add v4tov4 listenport=25565 listenaddress=0.0.0.0 connectport=25565 connectaddress=localhost
netsh interface portproxy show all
```

Shut down
```
docker stop minecraft_mc_1
```

## References

Guide that inspired this: 
https://spin.atomicobject.com/2021/07/21/host-minecraft-server-docker/

Server parameter documentation: 
https://github.com/itzg/docker-minecraft-server#server-configuration

