apiVersion: apps/v1
kind: Deployment
metadata:
  name: sandbox-dev-app-1
  labels:
    app: sandbox-dev-app-1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sandbox-dev-app-1
  template:
    metadata:
      labels:
        app: sandbox-dev-app-1
    spec:
      containers:
      - name: hello-cloudbuild
        image: asia.gcr.io/GOOGLE_CLOUD_PROJECT/docker-nodejs-hello-world:COMMIT_SHA
        ports:
        - containerPort: 3000
---
kind: Service
apiVersion: v1
metadata:
  name: sandbox-dev-app-1
spec:
  selector:
    app: sandbox-dev-app-1
  ports:
  - protocol: TCP
    port: 80
    targetPort: 3000
  type: NodePort
