#!/usr/bin/env bash

echo "----Building and publishing micro-service images----"

cd ../microone
mvn clean install
if docker build -t localhost:5000/microone:v1 . ; then
	docker push localhost:5000/microone:v1
fi

cd ../microtwo
mvn clean install
if docker build -t localhost:5000/microtwo:v1 . ; then
  docker push localhost:5000/microtwo:v1
fi

cd ../kubernetes-scripts

echo "----Completed successfully----"