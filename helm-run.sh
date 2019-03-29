#!/bin/bash
sudo chmod 777 /var/run/docker.sock
$(aws ecr get-login --no-include-email --region us-east-1)
sleep 5
#kubectl create serviceaccount --namespace kube-system tiller
#kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
#kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
/usr/local/bin/helm init
sleep 5
/usr/local/bin/helm delete --purge dev
sleep 5
/usr/local/bin/helm install devapp --name dev
sleep  5
/usr/local/bin/helm ls

