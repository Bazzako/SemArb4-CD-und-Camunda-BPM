FROM camunda/camunda-bpm-platform:latest

# BPMN und Forms kopieren
COPY ./processes /camunda/configuration/resources/