---
layout: default
title: 5.1 Erreichte Ziele
parent: 5. Abschluss
nav_order: 3
---

# Wurden alle Ziele erreicht ?


![Pokal](../ressources/bilder/success.png){: width="250px" }

[Quelle](../Quellenverzeichnis/index.md#erreichte-ziele)

Um zu rekapitulieren, welche Ziele zu erreichen waren, werde ich diese hier nochmals auflisten.

1.	*Erstellen eines Docker-Images, für das Deployment auf Kubernetes:*

    o	Erstellen eines Docker-Images, welches die Camunda-Engine und die BPMN-Dateien enthält.

    - Das Ziel habe ich erreicht, jedoch nicht ganz wie geplant. Ich konnte ein existierendes Docker Image verwenden und dieses Deployen. Ich habe meine .bpmn und .form files dann via Pipeline Deployed. Somit ist das ganze viel dynamischer.

2.	*Automatisierte CI/CD-Pipeline einrichten:*

    o	Implementierung einer CI/CD Pipepline in Github, die automatischen Änderungen am BPMN-Prozess überprüft und in den Kubernetes Cluster deployt

    - Das Ziel konnte ich erreichen

3.	*Automatisierte Unit-Tests in der Pipeline*

    o	Änderungen des BPMN-Prozesses sollen erst nach erfolgreichen Unit-Tests auf den Kubernetes Cluster deployt werden.

    - Das Ziel musste ich komplett anpassen, da ich keinen Zugriff auf den Quellcode von Camunda habe. Ich habe deshalb auf ein End-to-End testing gesetzt, welches die Überprüfung nach dem Deployment macht.

4.	*Zugriff auf das UI von Camunda*

    o	Damit man von extern Zugriff auf die Camunda Oberfläche hat, soll ein Ingress oder Loadbalancer auf dem Kubernetes-Cluster konfiguriert werden.

    - Das Ziel konnte ich erreichen.


# Feedback

Ich musste einige Ziele während der Arbeit etwas anpassen, da die Umsetzung teilweise keinen Sinn machte oder wie sie definiert waren nicht umsetzbar waren. Diese Ziele konnten aber alle erreicht werden.
