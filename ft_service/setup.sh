

#docker build --tag img . (tag to give a name to the created image)
#docker run -i -d -p 443:443 -p 80:80 img (run to create a container, -i to keep interactive, -d run in background)
#See docker ps -> Shows the running container
#See result on local port http://127.0.0.1/
#Docker kill to kill the container and system prune to kill all images
