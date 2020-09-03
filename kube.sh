#!/bin/bash

kubectl apply -f config_map.yml
kubectl create -f backend_pod.yml
kubectl create -f frontend_pod.yml
kubectl create -f nginx_pod.yml