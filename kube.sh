#!/bin/bash

kubectl apply -f /home/ubuntu/kubernetes_pods/config_map.yml
kubectl create -f backend_pod.yml
kubectl create -f frontend_pod.yml
kubectl create -f nginx_pod.yml