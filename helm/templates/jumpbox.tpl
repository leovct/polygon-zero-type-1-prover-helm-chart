apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-jumpbox
spec:
  # The number of replicas should be set to zero as it is managed by the HPA.
  replicas: 0
  selector:
    matchLabels:
      app: jumpbox
  template:
    metadata:
      labels:
        app: jumpbox
    spec:
      nodeSelector:
        {{ .Values.jumpbox.nodeSelector.key }}: {{ .Values.jumpbox.nodeSelector.value }}
      containers:
      - name: jumpbox
        image: {{ .Values.jumpbox.image }}
        command: [ "sleep" ]
        args: [ "infinity" ]