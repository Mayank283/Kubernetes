#!/usr/bin/env bash

cd ./gateway/
echo -e "----Cleaning up Ambassador API Gateway service----"
kubectl delete -f ambassador-rbac.yaml
kubectl delete -f ambassador-service.yaml
echo -e "-----------------------------------------------"

cd ../services/
echo -e "\n----Cleaning up first micro-service with side-proxy----"
kubectl delete -f service-first.yaml

echo -e "\n----Cleaning up second micro-service with side-proxy----"
kubectl delete -f service-second.yaml

cd ../deployments/
echo -e "\n----Cleaning up deployments and pods for first micro-service----"
kubectl delete -f deployment-microone-v1.yaml
echo -e "\n----Cleaning up deployments and pods for second micro-service----"
kubectl delete -f deployment-microtwo-v1.yaml


cd ../trafficmanagement/
echo -e "\n----Cleaning up circuit breaker rule for first micro-service----"
kubectl delete -f service-first-destination-rule.yaml
echo -e "\n----Cleaning up circuit breaker rule for second micro-service----"
kubectl delete -f service-second-destination-rule.yaml