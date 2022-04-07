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

Stop running
```
docker container stop gawk-serve
```

