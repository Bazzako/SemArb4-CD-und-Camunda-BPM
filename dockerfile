# Basis-Image für Camunda 8 Zeebe
FROM camunda/zeebe:8.2.0

# Setze das Arbeitsverzeichnis
WORKDIR /usr/local/zeebe

# Kopiere BPMN-Dateien ins Deployment-Verzeichnis
# (Optional, falls du eigene Prozesse direkt integrieren möchtest)
# COPY bpmn /usr/local/zeebe/resources/bpmn

# Exponiere die Standardports:
# 26500: Zeebe Gateway (gRPC)
# 9600: Metrics
EXPOSE 26500 9600

# Start Befehl für Zeebe
CMD ["bin/broker"]
