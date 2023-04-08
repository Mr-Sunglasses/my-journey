# Learning Docker

<br>

## What is Docker ?

<p align="center">
  <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f584c8d9-3240-4ad9-b0ed-77ac01ae1226/dbiu22u-6f07885b-6d51-4e38-ab33-7cfbf32e3240.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2Y1ODRjOGQ5LTMyNDAtNGFkOS1iMGVkLTc3YWMwMWFlMTIyNlwvZGJpdTIydS02ZjA3ODg1Yi02ZDUxLTRlMzgtYWIzMy03Y2ZiZjMyZTMyNDAuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.gY-OIyayWGoCQNz0ZVyCa6EqEvpjLQNIfH2yfY1NUTY" />
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

- <h3>Used to Build Your Own Images</h3>

  - Docker Image

    - Image is a template for creating an enviroment of your choice.
    - Snapshot
    - Has Everything needed to run your app
    - OS, Software, App Code

  - Basic example of a docker image

    - Let's dockerize a Simple Flask App

      - First Lets Create a Python venv by using command :-
        `python3 -m venv venv` <br> and activate it `source venv/bin/activate`

      - Now install flask
        `pip3 install flask`

      - Now create a requirements.txt
        `pip3 freeze > requirements.txt`

      - Now create a python file for the flask app
        `touch app.py`

      - The files seems something like this
        ```
        .
        ├── app.py
        ├── requirements.txt
        └── venv
        ```
      - Now Write a Simple Web Server With flask

        ```
        from flask import Flask

        app = Flask(__name__)

        @app.route("/")
        def home():
            return "<h1> Hello Flask </h1>"

        if __name__ == "__main__":
            app.run(port=8080)
        ```

      - Let's Write a DockerFile for this
        `touch Dockerfile` <br>

        ```
        FROM python3.10:latest

        WORKDIR /app

        COPY . /app

        RUN pip3 install -r requirements.txt

        CMD ["python3", "app.py"]
        ```

      - Now We need to just build and run this dockerfile <br>
        `docker build -t <name_and_tag_of_image> .` <br>
      - To run a container from the Image <br>
        `docker rum --name <name_of_container> -d -p 8080:8080 <name_and_tag_of_image>`

      - .dockerignore files

        - Sometimes we have files that we don't want to be copied in our image so these files are mentioned in the `.dockerignore` file

        - In the above flask dockerize example we don't want to copy our venv so we mention it in our dockerignore file. <br>

        - Example
          `touch .dockerignore` <br>
          Content of `.dockerignore`
          ```
          venv
          .git
          .gitignore
          ```

- <h3>Caching and Layers in a Dockerfile</h3>
