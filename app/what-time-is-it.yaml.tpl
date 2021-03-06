---
apiVersion: v1
kind: Namespace
metadata:
  name: demo
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: what-time-is-it
  namespace: demo
  labels:
    app: what-time-is-it
spec:
  selector:
    matchLabels:
      app: what-time-is-it
  template:
    metadata:
      labels:
        app: what-time-is-it
    spec:
      containers:
        - name:  what-time-is-it
          image: gcr.io/google-samples/hello-app:1.0
          ports:
            - containerPort: 8080
          resources:
            requests:
              cpu: 200m
---
apiVersion: v1
kind: Service
metadata:
  name: what-time-is-it
  namespace: demo
  labels:
    app: what-time-is-it
spec:
  selector:
    app: what-time-is-it
  ports:
    - port: 80
      targetPort: 8080
  type: ClusterIP
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: helloweb
  namespace: demo
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/issuer:      letsencrypt-prod
spec:
  tls:
    - hosts:
        - what-time-is-it.${domain_name}
      secretName: what-time-is-it-asg12
  rules:
    - host: what-time-is-it.${domain_name}
      http:
        paths:
          - path: /
            pathType: ImplementationSpecific
            backend:
              service:
                name: what-time-is-it
                port:
                  number: 80