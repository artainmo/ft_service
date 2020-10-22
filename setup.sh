#Install necessities
HOMEBREW_NO_AUTO_UPDATE=1 brew install docker
HOMEBREW_NO_AUTO_UPDATE=1 brew install docker-machine
HOMEBREW_NO_AUTO_UPDATE=1 brew install kubectl
HOMEBREW_NO_AUTO_UPDATE=1 brew install minikube
HOMEBREW_NO_AUTO_UPDATE=1 brew install telegraf


echo "========Minikube setup========"
#export MINIKUBE_HOME=/Users/artainmo/goinfre #Minikube in goinfre no memory problem
export MINIKUBE_HOME=/Users/arthurtainmont/goinfre
minikube start --vm-driver=virtualbox
minikube status #Test if everything is working
#Link your shell with minikube, so it has access to locally created images
eval $(minikube docker-env)
#IP=$(minikube ip) #Take the external IP of minikube
minikube addons enable dashboard
minikube addons enable metrics-server #Some dashboard features require the metrics-server addon
minikube dashboard & #launch minikube dashboard with & to make run in background


echo "========load balancer setup========"
#Install metallb for load blanacer https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml #create namespace/metallb-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml #install metallb for load balancer, on cluster under metallb-system
#On first install only, generate random bytes based secretkey
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f srcs/metallb.yaml
#configure metallb IP range with configmap object
#-f for file

#Build docker images
#Create kubernetes objects; services, deployments
echo "========Images and kubernetes objects setup========"

#Create volumes before image creation otherwise unbound persistentvolumeclaim pod error/
#Create influxdb service before the rest for telegraf
kubectl create -f srcs/influxdb/volumes_influxdb.yaml
docker build -t influxdb_img srcs/influxdb
kubectl create -f srcs/influxdb/influxdb.yaml

#Create mysql before the rest for wordpress and phpmyadmin
kubectl create -f srcs/mysql/volumes_mysql.yaml
docker build -t mysql_img srcs/mysql
kubectl create -f srcs/mysql/mysql.yaml

docker build -t nginx_img srcs/nginx
kubectl create -f srcs/nginx/nginx.yaml
#Finish ssh
ssh-keygen -R 192.168.99.130
#Removes all keys belonging to hostname from a known_hosts file. This option is useful to delete hashed hosts. Necessary otherwise host key verification fails. Cannot be done in container itself because need of ip-address file

docker build -t wordpress_img srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yaml

docker build -t ftps_img srcs/ftps
kubectl create -f srcs/ftps/ftps.yaml

docker build -t phpmyadmin_img srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml

docker build -t grafana_img srcs/grafana
kubectl create -f srcs/grafana/grafana.yaml

#Import own .sql file to add users to mysql database
#kubectl exec -i `kubectl get pods | grep -o "mysql\S*"` -- mysql -u root wordpress < srcs/mysql/wp_users.sql
#.sql has been generated, by adding users manually in phpmyadmin, going to export phpmyadmin section and generating .sql file
#kubectl exec allows to execute a command in a pod, "we grep the pod we want" and use -i to read the stdin, after -- the command to be executed in container is specified
#-u is to specify the default user root, wordpress to specify the database, left redirection imports the .sql file to the database

echo "========Users========"
cat users.txt
