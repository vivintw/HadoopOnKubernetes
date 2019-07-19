kubectl create secret generic name-node-secret  --from-file=ssh-privatekey=id_rsa --from-file=ssh-publickey=id_rsa.pub;
kubectl create secret generic data-node-secret  --from-file=ssh-publickey=id_rsa.pub;
