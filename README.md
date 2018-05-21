# Docker Scripts

These are scripts that make common docker activities easier.

The contents currently include:

`docker-enter` : This is my own variation of a script to use nsenter to run
  an additional command within a container.   This is superceeded by 
  "docker exec"

`docker-rebase` : This a script that performs a function simmilar to docker
  commit.  But rather than adding to an existing image's history, it creates
  a new image via "docker export" and "docker import" and then creates a
  dockerfile within a pipe to set all the same settings.

`bridge-default-route` : Create a bridge for the default route.  This is useful
  in combinations with the next script as a way to make docker containers
  accessible from other hosts

`docker-bridge` : Connect a docker container to a bridge.

## EXAMPLE: Creating a bridge accessible on the local network.

First create a bridge, br0, for your default route:
```
# bridge-default-route br0
```

Now go-ahead and create your containers with no network:
```
# CONTAINER=$(docker run -d --net=none -t -i fedora /bin/bash -i)
```
Finally connect your container to your bridge with a static ip address. 
```
# docker-bridge "$CONTAINER" address 192.168.1.68/24 bridge br0 broadcast 192.168.1.255 gateway 192.168.1.1
```
In this example, my router is 192.168.1.1.  The static IP address I assigned
to the container is 192.168.1.68.


