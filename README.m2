These are scripts that make common docker activities easier.

The contents currently include:

docker-enter : This is my own variation of a script to use nsenter to run
  an additional command within a container.   This is superceeded by 
  "docker exec"

docker-rebase : This a script that performs a function simmilar to docker
  commit.  But rather than adding to an existing image's history, it creates
  a new image via "docker export" and "docker import" and then creates a
  dockerfile within a pipe to set all the same settings.


