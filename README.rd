This repository for deploying MySQL, Laravel, Nginx, and other necessary components on Kubernetes:

# Laravel Application Deployment on Kubernetes

This repository provides a guide and example files for deploying a Laravel application on Kubernetes, including MySQL as the database and Nginx as the web server.

**Prerequisites**

Before proceeding with the deployment, make sure you have the following prerequisites:

- Kubernetes cluster up and running
- `kubectl` command-line tool configured to connect to your cluster

## Deployment Steps

Follow the steps below to deploy the Laravel application on Kubernetes:

1. Clone this repository to your local machine:
```
   git clone https://github.com/m-raoufi/roomview-k8s.git
   cd roomview-k8s
```
Customize the configuration files:

Adjust the MySQL and Laravel environment variables in the laravel-deployment.yaml file.
Modify the Nginx configuration in the nginx-configmap.yaml file according to your requirements.
Create the Kubernetes resources:

**Apply the MySQL deployment and service:**

   'kubectl apply -f Secrets/secret-mysql.yaml'
   'kubectl apply -f Deployments/mysql-deployment.yaml'

**Apply the Laravel deployment:**

   'kubectl apply -f laravel-deployment.yaml'

**Apply the Nginx deployment, ConfigMap, and NodePort service:**

   [kubectl apply -f nginx-deployment.yaml]
   'kubectl apply -f nginx-configmap.yaml
   kubectl apply -f nginx-service.yaml'

**Monitor the deployment:**

Check the status of the deployments:

   'kubectl get deployments'

**Verify the status of the pods:**

   'kubectl get pods'

**Access the Laravel application:**

Get the NodePort assigned to the Nginx service:

   'kubectl get service nginx-service'
Open a web browser and visit http://<NODE_IP>:<NODE_PORT> (replace <NODE_IP> and <NODE_PORT> with the appropriate values).

Troubleshooting
If you encounter any issues during the deployment or when accessing the Laravel application, refer to the Troubleshooting guide for common problems and their solutions.

Contributing
Contributions are welcome! If you find any bugs, have suggestions, or want to add new features, please open an issue or submit a pull request.

License
This project is licensed under the MIT License.

You can include this README.md file in the root directory of your GitHub repository. Feel free to modify it further to suit your specific needs and add any additional information you want to provide to users.
