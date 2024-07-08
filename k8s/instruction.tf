
## Wanderlust Project Setup Instructions for Kubernetes ##

## Running Wanderlust Project with Kubernetes and MongoDB

### Prerequisites:
- Ensure Minikube is installed and running on your local machine.
- Have `kubectl` configured to communicate with your Minikube cluster.
- Docker images `bakhtawar375/w-frontend` and `bakhtawar375/w-backend` are pushed to Docker Hub or a private registry accessible by Minikube.

### Steps:

1. **Start Minikube:**
   ```bash
   minikube start
Enable Docker Environment:
Ensure Minikube uses the Docker daemon of your local machine:

eval $(minikube docker-env)
Create Persistent Volumes and Claims:

# Create PersistentVolume (PV) and PersistentVolumeClaim (PVC) for MongoDB:
bash

kubectl apply -f mongo-pv.yml
kubectl apply -f mongo-pvc.yml
Deploy MongoDB:

# Deploy MongoDB using a Deployment and Service:

kubectl apply -f mongo-deployment.yml
Import Sample Data into MongoDB:

# Copy sample_posts.json into MongoDB pod:

kubectl cp /path/to/sample_posts.json mongodb-pod-name:/data/sample_posts.json
Run mongoimport command inside MongoDB pod:

kubectl exec -it mongodb-pod-name -- mongoimport --db wanderlust --collection posts --file /data/sample_posts.json --jsonArray

# Deploy Backend and Frontend services:

kubectl apply -f backend.yml
kubectl apply -f frontend.yml
Expose Services:

# Expose services to access them outside the cluster:

minikube service backend-service --url
minikube service frontend-service --url

# Access Your Application:

Open the URLs provided by the minikube service commands in your web browser to access the frontend and backend of your Wanderlust application.

# Clean Up (Optional):

When done, clean up by deleting resources:

kubectl delete deployment mongodb
kubectl delete service mongodb-service
kubectl delete deployment front-deploy
kubectl delete service frontend-service
kubectl delete deployment back-deploy
kubectl delete service backend-service
kubectl delete pvc mongo-pvc
kubectl delete pv mongo-pv

# Notes:
Replace /path/to/sample_posts.json with the actual path where sample_posts.json is located on your local machine.
Replace mongodb-pod-name with the actual name of your MongoDB pod.
Adjust URLs and service names (backend-service, frontend-service) as per your deployment configuration.


