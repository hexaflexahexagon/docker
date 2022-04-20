# Minecraft Server

## Notes

- TODO: figure out docker networking
- TODO: add other network hosts
- TODO: switches
- TODO: routers

## Topology

P         P
 \       /
  S-R-R-S
 /       \
P         P

- lan1 192.0.2.0/26: 0-63
	- pc1 .x
	- pc2 .x
	- r1  .x

- lan2 192.0.2.64/26: 64-127
	- pc1 .x
	- pc2 .x
	- r2  .x

- WAN 203.0.113.0/30: 0-3
	- r1  .x
	- r2  .x

## Commands

Start
```
docker-compose up -d
```

Login to a box
```
docker exec -it <container-name> /bin/bash
```

Stop
```
docker-compose down
```

## References

