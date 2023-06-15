# Deploying MySQL, Laravel, Nginx, and other Components on Kubernetes

This repository provides a guide and example files for deploying a Laravel application along with MySQL as the database and Nginx as the web server on a Kubernetes cluster.

## Prerequisites

Before proceeding with the deployment, make sure you have the following prerequisites:

- Kubernetes cluster up and running with Docker driver
- `kubectl` command-line tool configured to connect to your cluster

## Install PHP, Compose and Create Laravel project 

- Insttall php and composer on host
```bash
sudo apt update
sudo apt install php:74-fpm php-xml composer
```
- Run this command to create 
```bash
composer create-project laravel/laravel rommview-app
```

## Build Docker Image Steps

Follow the steps below to build the Mysql and Laravel and Nginx to create images :

- Run Docker build command

```bash
docker build -t mysql-roomview:v1 -f roomview-app/DockerFile-DB .
docker build -t laravel-roomview:v1 -f DockerFile-FPM .
docker build -t nginx-roomview:v1 -f DockerFile-Web .
```

## Deployment Steps

Follow the steps below to deploy the Laravel application on Kubernetes:

#### 1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/m-raoufi/roomview-k8s.git
   cd roomview-k8s
   ```
#### 2. Customize the configuration files:

Adjust the MySQL and Laravel environment variables in the laravel-deployment.yaml file.
Modify the Nginx configuration in the nginx-configmap.yaml file according to your requirements.

#### 3.Create the Kubernetes resources:

- Apply the MySQL Deployment and Secret:

```bash
kubectl apply -f Secrets/secret-mysql.yaml
kubectl apply -f Deployments/mysql-deployment.yaml
```

- Apply the Laravel Deployment and CluterIP Service:

```bash
kubectl apply -f Deployments/laravel-deployment.yaml
kubectl apply -f Services/laravel-service.yaml
```
- Apply the Nginx Deployment, ConfigMap, and NodePort service:

```bash
kubectl apply -f ConfigMaps/nginx-configmap.yaml
kubectl apply -f Deployments/nginx-deployment.yaml
kubectl apply -f Services/nginx-service.yaml
```

#### 4.Monitor the deployment:

- Check the status of the deployments:

```bash
kubectl get deployments
```
#### 5.Verify the status of the pods:

```bash
kubectl get pods
```

#### 6.Access the Laravel application:

- Get the NodePort assigned to the Nginx service:

```bash
kubectl get service nginx-service
```
- Open a web browser and visit http://<NODE_IP>:<NODE_PORT> (replace <NODE_IP> and <NODE_PORT> with the appropriate values).

## Troubleshooting
If you encounter any issues during the deployment or when accessing the Laravel application, refer to the Troubleshooting guide for common problems and their solutions.

## Contributing
Contributions are welcome! If you find any bugs, have suggestions, or want to add new features, please open an issue or submit a pull request.

#### License
This project is licensed under the RMV License.

