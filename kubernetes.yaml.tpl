apiVersion: apps/v1
kind: Deployment
metadata:
  name: CONTAINER_CLUSTER
  labels:
    app: CONTAINER_CLUSTER
spec:
  replicas: 1
  selector:
    matchLabels:
      app: CONTAINER_CLUSTER
  template:
    metadata:
      labels:
        app: CONTAINER_CLUSTER
    spec:
      containers:
      - name: CONTAINER_CLUSTER
        image: asia.gcr.io/GOOGLE_CLOUD_PROJECT/IMAGE_NAME:COMMIT_SHA
        ports:
        - containerPort: 3000
---
kind: Service
apiVersion: v1
metadata:
  name: CONTAINER_CLUSTER
spec:
  selector:
    app: CONTAINER_CLUSTER
  ports:
  - protocol: TCP
    port: 80
    targetPort: 3000
  type: NodePort
