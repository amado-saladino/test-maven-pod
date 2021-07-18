#! /bin/bash

kubectl create -f pod.yml

pod_ip=`kubectl get pod maven-test-runner -o jsonpath='{.status.podIP}'`
sed -i "s/{POD-IP}/${pod_ip}/g" service.yml
kubectl create -f service.yml