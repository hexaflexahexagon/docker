# Minecraft Server

## Notes

- Hosts a minecraft server on localhost:25565
- Note: Be sure the windows IP Helper service is _disabled_ before bringing the container up!

- TODO: maybe try and limit init ram because it locks up my entire PC lol
- TODO: change rcon password

## Commands

Set up - Powershell:
```
netsh interface portproxy delete v4tov4 listenport=25565 listenaddress=0.0.0.0
net stop iphlpsvc
```

Start - WSL:
```
docker-compose up -d
```

Log in:
```
# Bash
docker exec -it minecraft_mc_1 /bin/bash

# Rcon
docker exec -i minecraft_mc_1 rcon-cli

```

Setup Windows portproxy for LAN:
```
net start iphlpsvc
netsh interface portproxy add v4tov4 listenport=25565 listenaddress=0.0.0.0 connectport=25565 connectaddress=localhost
netsh interface portproxy show all
```

Shut down:
```
docker stop minecraft_mc_1
```

## References

Guide that inspired this: 
https://spin.atomicobject.com/2021/07/21/host-minecraft-server-docker/

Server parameter documentation: 
https://github.com/itzg/docker-minecraft-server#server-configuration

IP Helper commands: 
https://www.thewindowsclub.com/enable-or-disable-ip-helper-service-on-windows-10

