# Learning Docker

<br>

## What is Docker ?

<p align="center">
  <img src="https://media4.giphy.com/media/bm02BE6DQ4Oag8GXep/giphy.gif?cid=ecf05e472rt97dwh4e1dyqaf28azutr8j3xh8thapfaijqcw&rid=giphy.gif&ct=g" />
</p>

- Docker is a tool for Running applications in an isolated enviroment
- It is Much Similar to Virtual Machine
- App Runs in same Environment. ie. **It Just Works**
- It is a Standard for Software Deployment

## Commands

- To Pull an Image from DockerHub
  `docker pull image_name`
- To See all the Available Images
  `docker images`
- To run a Container from an Image
  `docker run image_name:version`
- To run a Container from an Image in Background mode
  `docker run -d image_name:version`
- To run Container from an Image in a Port
  `docker run -d -p 8080:80 image_name:version`
- To Start run Container from an Image in multiple port
  `docker run -d -p 80:8080 -p 80:3000 image_name:version`
- To Stop the Container
  `docker stop container_name/container_id`
- To Start the container
  `docker start container_name/container_id`
- To view Running Container
  `docker ps`
- To view all Containers
  `docker ps -a`
- To view all Container Id
  `docker ps -a -q`
- To remove a Container
  `docker rm container_name/container_id`
- To remove all Container
  `docker rm $(docker ps -a -q)`
- To remove a running Container
  `docker rm -f container_name/container_id`

# Docker Volume

- Allow Sharing of Data Files and Folders
- Between Host and Containers
- Between Containers

## Commands for Docker Volume

- To Share any file/ Folder in readonly mode
  `docker run --name kanha -d -p 8080:80 -v $(pwd):/usr/share/nginx/html:ro nginx:latest`

- To Share any File / Folder in read and write mode
  `docker run --name kanha -d -p 8080:80 -v $(pwd):/usr/share/nginx/html: nginx:latest`

- To Execute and Run a container in interactive mode
  `docker exec -it container_name bash`

## Sharing Volume Between Containers

- TO Share volume of one container with other container
  `docker run --name balalali -d -p 8081:80 --volumes-from parent_container_name nginx:latest`

# DockerFile

- Used to Build Your Own Images
