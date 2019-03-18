#!/usr/bin/env bash

echo "----Building and publishing micro-service images----"

cd ../microtwo
mvn clean install
if docker build -t localhost:5000/microtwo:v2 . ; then
	docker push localhost:5000/microtwo:v2
fi

cd ../kubernetes-scripts

echo "----Completed successfully----"