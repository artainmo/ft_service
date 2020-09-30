#Installing kubectl for the master node commands and minikub to run the cluster on it
brew install kubectl
brew install minikube
brew install telegraf

#Run minikube on the host instead of one a VM, use --driver=none, now a cluster has been created
minikube start --driver=none
#Test if everything is working
#To clear minikube local state use minikube delete and to stop the cluster minikube stop
minikube status

#Take the external IP of minikube and save it in an external file for it to be accessible for containers
IP=$(minikube ip)
$IP > srcs/ip.txt
#Link your shell with minikube, so it has access to locally created images
eval $(minikube docker-env)

#install metallb for load balancer, on cluster under metallb-system
#kubectl create -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
#Launch metallb with metallb yalm file
#kubectl create -f metallb-system/metallb.yalm

#Install metallb for load blanacer
minikube addons configure metallb
#Set load balancer start ip
echo $IP
#Set load balancer end ip
echo $IP

#nginx
docker build --tag nginx srcs/nginx #Create image with dockerfile
kubectl create -f srcs/nginx/nginx.yalm #Create pods with YALM files (images are called in YALM file)


#worpdpress
docker build --tag wordpress srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yalm


#influxdb
docker build --tag influxdb srcs/influxdb
kubectl create -f srcs/influxdb/influxdb.yalm


#phpmyadmin
docker build --tag phpmyadmin srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yalm


#FTPS
docker build --tag ftps srcs/ftps
kubectl create -f  --build-arg IP=$IP srcs/ftps/ftps.yalm #Giving the minikube ip as parameter to docker file


#Grafana
docker build --tag srcs/grafana
kubectl create -f srcs/grafana/grafana.yalm

#Launch the online kubernetes platform
Minikube dashboard

open http://$IP
