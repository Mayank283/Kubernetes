#!/usr/bin/env bash


cd ./trafficmanagement/
echo -e "----Attaching circuit breaker rule to second micro-service----"
kubectl apply -f service-second-circuit-breaker.yaml