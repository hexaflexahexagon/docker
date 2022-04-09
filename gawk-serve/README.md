# GAWK Serve

## Notes

- Example of docker structure to host a detached container that hosts a web server on an open port
- Uses a GAWK script, for fun
- Runs on port 8080 inside and outside of the container

## Usage

Build
```
docker build -t gawk-serve .
```

Run
```
docker run -dp 8080:8080 --name gawk-serve --rm gawk-serve
```

Verify status
```
docker container ls
curl localhost:8080
```

To make reachable from LAN computers within WSL (in powershell):
```
# Add proxy via command, where listenport = <listenaddress>:<listenport> on remote PC's web browser
# And connectport is what's forwarded to <connectaddress>:<connectport>, in this case localhost is WSL running docker.
netsh interface portproxy add v4tov4 listenport=4000 listenaddress=0.0.0.0 connectport=8080 connectaddress=localhost

# To remove the above rule when done:
netsh interface portproxy show all
netsh interface portproxy delete v4tov4 listenport=4000 listenaddress=0.0.0.0
```

Stop running
```
docker container stop gawk-serve
```

