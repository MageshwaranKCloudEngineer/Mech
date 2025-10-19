#!/bin/bash

set -x
set -m

# Step 1: Use Minikube's Docker daemon
eval $(minikube docker-env)

# Step 2: Wait for Kubernetes API to be ready
until kubectl cluster-info >/dev/null 2>&1; do
  echo "Waiting for Kubernetes API to be ready..."
  sleep 5
done

# Step 3: Ask if Docker image should be rebuilt
read -p "Rebuild Docker image? (y/n): " rebuild
if [[ "$rebuild" == "y" || "$rebuild" == "Y" ]]; then
  docker build -t mechwiz:latest .
fi

# Step 4: Create namespace if it doesn't exist
kubectl get namespace mech >/dev/null 2>&1 || kubectl create namespace mech

# Step 5: Apply Kubernetes manifests
kubectl apply -f k8/dynamodb*.yaml
kubectl apply -f k8/ -n mech

# Step 6: Verify deployments and services
kubectl get pods -n mech
kubectl get svc -n mech
kubectl get ingress -n mech


wait_time=10 # seconds
echo "Waiting $wait_time seconds for services to stabilize..."
sleep $wait_time

kubectl get pods 
kubectl get svc
kubectl get ingress

# Step 7: Port-forward services in background
echo "Starting port-forward for Mechwiz service (8081 -> 80)..."
kubectl port-forward svc/mechwiz-service 8081:80 -n mech > /dev/null 2>&1 &
MECH_PID=$!

echo "Starting port-forward for Grafana service (3000 -> 3000)..."
kubectl port-forward svc/grafana-service 3000:3000 -n mech > /dev/null 2>&1 &
GRAF_PID=$!

echo "Starting port-forward for DynamoDB service (8000 -> 8000)..."
kubectl port-forward service/dynamodb-service 8000:8000 > dynamodb.log 2>&1 &

DYNAMO_PID=$!

echo "Starting port-forward for Prometheus service (9090 -> 9090)..."
kubectl port-forward svc/prometheus-service 9090:9090 -n mech > /dev/null 2>&1 &
PROM_PID=$!

echo ""
echo "All port-forwards started in background:"
echo " - Mechwiz:     http://localhost:8081"
echo " - Grafana:     http://localhost:3000"
echo " - DynamoDB:    http://localhost:8000"
echo " - Prometheus:  http://localhost:9090"
echo ""
echo "Press Ctrl+C to stop all services and clean up."

# Step 8: Handle Ctrl+C (SIGINT) to clean up
trap "
echo '';
echo 'Stopping port-forwards and cleaning up...';
kill \$MECH_PID \$GRAF_PID \$PROM_PID 2>/dev/null;

# Delete all resources in namespace
kubectl delete all,ingress,configmap,secret,pvc --all -n mech;

exit 0" SIGINT

# Step 9: Wait for all background processes to keep script alive
wait $MECH_PID $GRAF_PID $DYNAMO_PID $PROM_PID
