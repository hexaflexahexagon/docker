# Docker Notes

## Notes

Docker _Images_ are configs that define how to create containers. They can be layered.
Docker _Containers_ are the runtime environments themselves.

Docker containers share the same kernel as the host system, the only isolation is PID trickery that creates
a fake PID 1 init process. Be careful with security before hosting on a live (public) system.

## Commands

Image management
```
# List images
docker images

# Build image from Dockerfile
docker build -t [name] .

# Remove an image
docker rmi [image name]
```

Container management
```
# List all containers
docker ps -a

# Start new detached container with open ports
docker run -dp [container port]:[host port] --name [container name] --rm [container name] [image_name]

# Start new interactive container
docker run -dit --name [container name] [image name]

# Run command within container (you want /bin/bash for interactive access)
docker exec -it [container name] [command]

# Stop container
docker container stop [container name]

# Delete container (-f = delete even if running)
docker rm -f [container name]
```


## References

Example CTF-style containers: 
https://github.com/LiveOverflow/pwn_docker_example

Packet Pushers basic writeup: 
https://packetpushers.net/building-a-docker-network-automation-container/

Image vs Container: 
https://phoenixnap.com/kb/docker-image-vs-container

Basic Networking: 
https://www.youtube.com/watch?v=j_UUnlVC2Ss

Linux Ethernet Bridging (make a switch): 
https://wiki.linuxfoundation.org/networking/bridge

