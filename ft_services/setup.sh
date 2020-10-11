#To relaunch each time;
#export MINIKUBE_HOME=/Users/artainmo/goinfre
#minikube delete
#rm -rf goinfre/.minikube
#Uninstall and reinstall vm in managed software center
#Restart computer
HOMEBREW_NO_AUTO_UPDATE=1 brew install kubectl
HOMEBREW_NO_AUTO_UPDATE=1 brew install minikube
HOMEBREW_NO_AUTO_UPDATE=1 brew install telegraf

#https://kubernetes.io/docs/tasks/tools/install-minikube/
echo "========run minikube========"
export MINIKUBE_HOME=/Users/artainmo/goinfre #Minikube in goinfre no memory problem
minikube start --vm-driver=virtualbox

#Test if everything is working
#To clear minikube local state use minikube delete and to stop the cluster minikube stop
minikube status

#Take the external IP of minikube
IP=$(minikube ip)
echo "========minikube IP========"
echo $IP
#Link your shell with minikube, so it has access to locally created images
eval $(minikube docker-env)

#install metallb for load balancer, on cluster under metallb-system
#kubectl create -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
#Launch metallb with metallb yalm file
#kubectl create -f metallb-system/metallb.yalm

#Install metallb for load blanacer https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df
minikube addons enable metallb
#Set load balancer start ip and end ip -> minikube ip ending with 10 - 20 (will be demanded in shell), will be set in minikube each time you reuse the same minikube
#minikube addons configure metallb
kubectl apply -f srcs/metallb.yaml
#configure metallb with configmap object

#Enable the dashboard
minikube addons enable dashboard
#Some dashboard features require the metrics-server addon
minikube addons enable metrics-server
#Launch the online kubernetes platform with ampersand for run in background
Minikube dashboard &

#mysql
docker build --tag mysql srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml

#phpmyadmin
docker build --tag phpmyadmin srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

#worpdpress
docker build --tag wordpress --build-arg IP=$IP srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

#nginx
docker build --tag nginx srcs/nginx #Create image with dockerfile
kubectl apply -f srcs/nginx/nginx.yaml #Create pods with YALM files (images are called in YALM file)

#FTPS
docker build --tag ftps --build-arg IP=$IP srcs/ftps
kubectl apply -f  srcs/ftps/ftps.yaml #Giving the minikube ip as parameter to docker file

#influxdb
docker build --tag influxdb srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

#Grafana
docker build --tag grafana srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml

open http://$IP
#Go to minikube IP
