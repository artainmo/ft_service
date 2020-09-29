#Installing kubectl for the master node commands and minikub to run the cluster on it
brew install kubectl
brew install minikube

#Run minikube on the host instead of one a VM, use --driver=none, now a cluster has been created
minikube start --driver=none
#Test if everything is working
#To clear minikube local state use minikube delete and to stop the cluster minikube stop
minikube status



#nginx
docker build --tag nginx_image .
kubectl create nginx --image=nginx_image
kubectl expose nginx --type=loadbalancer --port=80 --port=443


#worpdpress
docker build
kubectl create


#influxdb
docker build
kubectl create


#phpmyadmin
docker build
kubectl create


#FTPS
docker build
kubectl create


#Grafana
docker build
kubectl create


#Load balancer
docker build
kubectl create


#Launch the online kubernetes platform
Minikube dashboard
