# Docker

## Commands

- Start container: `docker run <image>`
- Start container detached: `docker run -d <image>`
- Start container interactively: `docker run -it <image>`
- List all images: `docker image`
- Copy image to Docker host: `docker pull`
- Remove images from Docker host: `docker rmi`

- List running containers: `docker ps`
- Stop running containers: `docker stop`
- Remove / Delete stopped containers: `docker rm`


## Concepts

Swarm = A cluster of Docker engines \
Manager nodes manages swarm - Usually 3 or 5 \
Only 1 leader \
Worker nodes execute tasks \
Service - Declarative & scalable way to run tasks \
Tasks - Assigned to workers (containers)

 
