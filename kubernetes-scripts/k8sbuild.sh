#!/usr/bin/env bash

cd ./gateway/
echo -e "----Creating Ambassador API Gateway service----"
kubectl apply -f ambassador-rbac.yaml
kubectl apply -f ambassador-service.yaml

cd ../services/
echo -e "\n----Creating k8s service for first micro-service----"
kubectl apply -f service-first.yaml

echo -e "\n----Creating k8s service for second micro-service----"
kubectl apply -f service-second.yaml

cd ../deployments/
echo -e "\n----Creating deployments and pods with side car for first micro-service version 1----"
kubectl apply -f deployment-microone-v1.yaml

echo -e "\n----Creating deployments and pods with side car for second micro-service version 1----"
kubectl apply -f deployment-microtwo-v1.yaml