#Installing kubectl for the master node commands and minikub to run the cluster on it
brew install kubectl
brew install minikube

#Run minikube on the host instead of one a VM, use --driver=none, now a cluster has been created
minikube start --driver=none
#Test if everything is working
#To clear minikube local state use minikube delete and to stop the cluster minikube stop
minikube status


#nginx
docker build --tag nginx_ srcs/nginx #Create image with dockerfile
kubectl create -f srcs/nginx/nginx.YAML #Create pods with YALM files


#worpdpress
docker build --tag wordpress_ srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.YAML


#influxdb
docker build --tag influxdb_ srcs/influxdb
kubectl create -f srcs/influxdb/influxdb.YALM


#phpmyadmin
docker build --tag phpmyadmin_ srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.YALM


#FTPS
docker build --tag ftps_ srcs/ftps
kubectl create -f srcs/ftps/ftps.YALM


#Grafana
docker build --tag srcs/grafana
kubectl create -f srcs/grafana/grafana.YALM



#Launch the online kubernetes platform
Minikube dashboard
