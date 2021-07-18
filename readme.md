# Overview

Run tests with selenium and maven in a multi-container pod.

## Pod design

- Init Container to check out the test code
- Container for running the tests with maven
- nginx-based container for the test report

The pod can be deployed using this command: `kubectl create -f pod.yml`

## Exposing the pod

For exposing the pod, I created an endpoint to the pod, it will dynamically get the pod IP and replace the placeholder inside `service.yml` configuration file.

### The Service

This is a service without a selector, this service will automatically get connected to the endpoint. But why is all this? Exposing the service directly does not work, the service would not have any endpoint!!

Check the service node port `kubectl describe service test-service`

Open the browser and navigate to `http://<Host-IP>:<Service-node-port>`

## Port forward

This is a workaround for accessing the pod

`kubectl port-forward --address 0.0.0.0 maven-test-runner 8000:80`

## Video

Check the [video demo](https://www.youtube.com/watch?v=kl2YCDDJCYY) to see this in action