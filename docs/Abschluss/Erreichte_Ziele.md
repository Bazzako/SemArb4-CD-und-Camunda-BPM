---
layout: default
title: 5.1 Erreichte Ziele
parent: 5. Abschluss
nav_order: 3
---

# Wurden alle Ziele erreicht ?


![Pokal](../../ressources/bilder/rsz_trophy.png)

[Quelle](../Quellenverzeichnis/index.md#erreichte-ziele)

Um zu rekapitulieren, welche Ziele zu erreichen waren, werde ich diese hier nochmals auflisten.

1.	*Erstellen eines Docker-Images, für das Deployment auf Kubernetes:*

    o	Erstellen eines Docker-Images, welches die Camunda-Engine und die BPMN-Dateien enthält.
2.	*Automatisierte CI/CD-Pipeline einrichten:*

    o	Implementierung einer CI/CD Pipepline in Github, die automatischen Änderungen am BPMN-Prozess überprüft und in    den Kubernetes Cluster deployt
3.	*Automatisierte Unit-Tests in der Pipeline*

    o	Änderungen des BPMN-Prozesses sollen erst nach erfolgreichen Unit-Tests auf den Kubernetes Cluster deployt werden.
4.	*Zugriff auf das UI von Camunda*

    o	Damit man von extern Zugriff auf die Camunda Oberfläche hat, soll ein Ingress oder Loadbalancer auf dem Kubernetes-Cluster konfiguriert werden.


# Wie habe ich meine Ziele erreicht ?
