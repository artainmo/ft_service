#Installing kubectl for the master node commands and minikub to run the cluster on it
brew install kubectl
brew install minikube
brew install telegraf

#https://kubernetes.io/docs/tasks/tools/install-minikube/
echo "========run minikube========"
minikube start --vm-driver=virtualbox

#Test if everything is working
#To clear minikube local state use minikube delete and to stop the cluster minikube stop
minikube status

#Take the external IP of minikube
IP=$(minikube ip)
echo "========minikube IP: $IP========"
#Link your shell with minikube, so it has access to locally created images
eval $(minikube docker-env)

#install metallb for load balancer, on cluster under metallb-system
#kubectl create -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
#Launch metallb with metallb yalm file
#kubectl create -f metallb-system/metallb.yalm

#Install metallb for load blanacer
minikube addons configure metallb
#Set load balancer start ip
exit

#influxdb
docker build --tag influxdb srcs/influxdb
kubectl create -f srcs/influxdb/influxdb.yalm

#nginx
docker build --tag nginx srcs/nginx #Create image with dockerfile
kubectl create -f srcs/nginx/nginx.yalm #Create pods with YALM files (images are called in YALM file)


#worpdpress
docker build --tag wordpress --build-arg IP=$IP srcs/wordpress
#docker build --tag --build-arg IP=127.0.0.1 wordpress srcs/wordpress #to test one container at a time
kubectl create -f srcs/wordpress/wordpress.yalm

#mysql
docker build --tag mysql srcs/mysql
kubectl create -f srcs/mysql/mysql.yalm

#influxdb
docker build --tag influxdb srcs/influxdb
kubectl create -f srcs/influxdb/influxdb.yalm

#phpmyadmin
docker build --tag phpmyadmin --build-arg IP=$IP srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yalm


#FTPS
docker build --tag ftps --build-arg IP=$IP srcs/ftps
kubectl create -f  srcs/ftps/ftps.yalm #Giving the minikube ip as parameter to docker file


#Grafana
docker build --tag grafana srcs/grafana
kubectl create -f srcs/grafana/grafana.yalm

#Launch the online kubernetes platform
Minikube dashboard

open http://$IP
