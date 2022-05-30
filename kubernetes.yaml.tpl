apiVersion: apps/v1
kind: Deployment
metadata:
  name: SERVICE_NAME
  labels:
    app: SERVICE_NAME
spec:
  replicas: 1
  selector:
    matchLabels:
      app: SERVICE_NAME
  template:
    metadata:
      labels:
        app: SERVICE_NAME
    spec:
      containers:
      - name: SERVICE_NAME
        image: asia.gcr.io/GOOGLE_CLOUD_PROJECT/IMAGE_NAME:COMMIT_SHA
        ports:
        - containerPort: 3000
---
kind: Service
apiVersion: v1
metadata:
  name: SERVICE_NAME
spec:
  selector:
    app: SERVICE_NAME
  ports:
  - protocol: TCP
    port: 80
    targetPort: 3000
  type: NodePort
