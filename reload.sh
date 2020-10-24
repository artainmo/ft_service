#Recreate all the images and containers without deleting and restarting minikube


#Be in the minikube shell
export MINIKUBE_HOME=/Users/artainmo/goinfre
#export MINIKUBE_HOME=/Users/arthurtainmont/goinfre
eval $(minikube docker-env)

#delete images and kubernetes objects
kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all services
kubectl delete --all pvc
kubectl delete --all pv
docker image rm influxdb_img
docker image rm mysql_img
docker image rm nginx_img
docker image rm wordpress_img
docker image rm ftps_img
docker image rm phpmyadmin_img
docker image rm grafana_img

#Rebuild metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml #create namespace/metallb-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create -f srcs/metallb.yaml

#Rebuild images and kubernetes objects
kubectl apply -f srcs/influxdb/volumes_influxdb.yaml
docker build -t influxdb_img srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

kubectl apply -f srcs/mysql/volumes_mysql.yaml
docker build -t mysql_img srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml

docker build -t nginx_img srcs/nginx
kubectl create -f srcs/nginx/nginx.yaml
ssh-keygen -R 192.168.99.130

docker build -t wordpress_img srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

docker build -t ftps_img srcs/ftps
kubectl create -f srcs/ftps/ftps.yaml

docker build -t phpmyadmin_img srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

docker build -t grafana_img srcs/grafana
kubectl create -f srcs/grafana/grafana.yaml

kubectl exec -i $(kubectl get pods | grep mysql | cut -d ' ' -f 1) -- mysql -u root wordpress < srcs/mysql/wordpress.sql
