# ft_services

42 school [subject](https://cdn.intra.42.fr/pdf/pdf/53690/en.subject.pdf).

Infrastructure setup of different services, with each having own unique container, via kubernetes to create a multi-service cluster.

## Use
### Docker
#### Install
Brew install docker<br>
Brew install docker-machine<br>
docker-machine create default<br>
Install virtual box<br>
Script

#### Commands
```
# Build a docker image from a Dockerfile
docker build -t <your image name> <your Dockerfile dir>
# Start an instance of a docker image
docker run -it <your image name>
# Really important if you want to bind some ports on the container to your own computer, use -p option.
# Exemple for an Apache image using port 80 in the container as our port 80
docker run -it debian:apache -p 80:80
# See all images
docker images
# See running containers
docker ps
# Stop a container
docker kill <container ID>
# Delete all unused Docker images and cache and free SO MUCH SPACE on your computer
docker system prune
# View content of a docker image, through a shell
Docker run -it image sh
# Simply run in background
Docker -d -p 80:80 img
# Enter running container
Docker exec containerid sh

Docker build --tag img .
Docker run -p 5050:5050 -dit --name i2 img
docker-machine ip

Docker system prune
Docker rm -f container-id
docker rm $(docker ps -a -q) #all containers
Docker image rm

Docker images
Docker ps
```

### Minikube
minikube delete -p minikube<br>
Virtualbox -> settings -> system -> processor -> 2cores

### Kubernetes
Kubectl delete deployment<br>
Kubectl delete service

### Users
wordpress - artainmo : pass123<br>
phpmyadmin - artainmo : pass123<br>
grafana - artainmo : pass123<br>
ssh - ssh artainmo@192.168.99.130 : pass123<br>
ftps - 192.168.99.133 : artainmo : pass123 : 21

### Test specific services
To test ftps -> https://filezilla-project.org/<br>
APP = pure-ftpd<br>
APP = influxd<br>

To test ssh -> ssh user@IP

## Notes
First have a kubernetes cluster, after you can deploy your containers on it.<br>
For this you need to create deployment and then expose it publicly via a service.

To deploy your containers, you need a kubernetes deployment configuration, this will instruct the master node how to create and update. This will constantly monitor the containers, if one container goes down it replaces it with another node, allowing recovery from machine failure.<br>
To create one you need to use Kubectl, it uses the kubernetes api to interact with the cluster.

A node is a worker machine, each node is managed by the kubernetes master. Each node contains one or more pods.<br>
Every kubernetes node runs at least:
- Kubelet, a process responsible for communication between node and master, it manages the pods and containers on a machine.
- A container runtime like docker (that sits in a pod), responsible for unpacking the container, pulling the container image and running the application.

A pod is a group of one or more containers that have shared resources, like IP address and port. By creating a deployment pods are created.<br>
Each pod is tied to a node until termination. In case of a failure identical pods are scheduled on other nodes.

A service is a grouping of pods, the set of pods is determined by a LabelSelector. Services allow you to receive traffic and can be exposed in different ways for example through a load balancer.<br>
The load balancer assigns a fixed external IP to the service, allowing you to not exposing the nodes themselves and giving one endpoint (entry point).

### Steps to do
- Master node / Deployment - kubectl
- Node
- Service - LabelSelector - Loadbalancer
- Pod - YAML
- Container - Docker
- Img

One IP? Loadbalancer should balance services over an IP range...
- https://metallb.universe.tf/usage/ -> how to force multiple services on one IP
- externalTrafficPolicy: local -> Use the host IP

### Containers groups
metallb - necessary for all<br>
Mysql, wordpress, phpmyadmin - dependent to each other<br>
Nginx -> contains http https and ssh<br>
ftps<br>
Telegraf -> influxdb -> grafana

### Bugs
Machine-ip ip -> not working:<br>
(./docker-setup)<br>
docker-machine rm default<br>
docker-machine create --driver virtualbox default<br>
docker-machine env default<br>
eval $(docker-machine env default)<br>
proxy_pass phpmyadmin => set /phpmyadmin/index.php

### How to run multiple instances
This is not necessary for ft_services.<br>
For increased traffics scaling is necessary, this is done through changing the number of replicas.
