#!/bin/bash

show() {
    cmd=$@
    read -p "$ $cmd"
    bash -c "$cmd"
}

show kubectl apply -f statefulset.yml
show kubectl get pods -w -l app=nginx
echo
show kubectl get service nginx
show kubectl get statefulset web

show "for i in 0 1; do kubectl exec web-\$i -- sh -c 'hostname'; done"
show "for i in 0 1; do kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rm nslookup web-\$i.nginx; done"
