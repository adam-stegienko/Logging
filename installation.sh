#!/bin/bash

kubectl delete ns logging
# Install Elasticsearch
helm install elasticsearch elastic/elasticsearch -n logging --create-namespace -f ./es-values.yaml
sleep 50
k get pods -n logging
sleep 10

# Install Kibana
helm install kibana elastic/kibana -n logging -f ./kibana-values.yaml
sleep 20

# Install Fluentd
helm install fluentd fluent/fluentd -n logging -f ./fluentd-values.yaml
sleep 5

# Ingress value
# rando_details:{ color:blue and number > 10 } 

# Open all ports
# kubectl port-forward svc/elasticsearch-master 9200 -n logging
# kubectl port-forward deployment/kibana-kibana 5601:5601 -n logging
# kubectl port-forward svc/fluentd 24231:24231 -n logging

# Install Rando App
# helm install rano-app rando-app -n logging -f ./random.yaml