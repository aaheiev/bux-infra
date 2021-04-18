## CI
```shell
docker build -t what-time-is-it:0.0.1 .
docker scan what-time-is-it:0.0.1
docker tag what-time-is-it:0.0.1 gcr.io/bux-assignment-aaheiev/what-time-is-it:0.0.1
docker push gcr.io/bux-assignment-aaheiev/what-time-is-it:0.0.1
```

```shell
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)
```

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/cloud/deploy.yaml
```

gcloud container clusters get-credentials  demo-88945488 --region europe-west1

kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/cloud/deploy.yaml
