#!/bin/bash

docker build -t headlamp .
docker tag headlamp 192.168.64.3:32000/headlamp
docker push 192.168.64.3:32000/headlamp

microk8s kubectl rollout restart -n kube-system deployment/headlamp
echo "microk8s kubectl port-forward -n kube-system service/headlamp 3000:80"

echo ""
echo "sudo /snap/microk8s/current/bin/ctr --address /var/snap/microk8s/common/run/containerd.sock -n k8s.io image rm 192.168.64.3:32000/headlamp:latest"

