#Delete minikube

minikube delete
export MINIKUBE_HOME=/Users/arthurtainmont/goinfre
#export MINIKUBE_HOME=/Users/artainmo/goinfre
minikube delete -p minikube
minikube delete
rm -rf /Users/artainmo/goinfre/.minikube


#Delete DS_Store
rm -rf .DS_Store
rm -rf srcs/.DS_Store
rm -rf srcs/ftps/.DS_store
rm -rf srcs/grafana/.DS_Store
rm -rf srcs/influxdb/.DS_Store
rm -rf srcs/mysql/.DS_Store
rm -rf srcs/nginx/.DS_Store
rm -rf srcs/phpmyadmin/.DS_Store
rm -rf srcs/wordpress/.DS_Store

