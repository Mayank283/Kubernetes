#!/usr/bin/env bash

cd ./deployments/
echo -e "\n----Creating deployments and pods with side car for second micro-service version 2----"
kubectl apply -f deployment-microtwo-v2.yaml