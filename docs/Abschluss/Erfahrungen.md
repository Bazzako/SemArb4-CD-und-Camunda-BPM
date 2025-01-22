---
layout: default
title: 5.2 Erfahrungen
parent: 5. Abschluss
nav_order: 4
---

# Gemachte Erfahrungen

In diesem Kapitel werde ich meine Semesterarbeit reflektieren.


![Erfahrungen](../../ressources/bilder/rsz_experience.png)

[Quelle](../Quellenverzeichnis/index.md#erfahrungen)

# Probleme

## Camunda

Ich hatte schon länger nicht mehr mit Camunda gearbeitet und musste mich nochmal kurz durch meine 2.Semesterarbeit durchlesen. Beim versuch mein .bpmn File zu deployen warf es mir immer Errors aus. Nach längerer Fehlersuche habe ich dann bemerkt, dass ich eine alte Version des .bpmn files für das Deployen gewählt habe (in einem falschen pfad), weshalb es nicht funktioniert hat. Ich suchte in meinem Repo nach dem aktuellen file und habe dieses gefunden. Schlussendlich klappte dann auch das Deployen und ich konnte mit der Arbeit weiter machen.

## Helm Chart

Ursprünglich war geplant die gesammte Camunda Umgebung mit einem existierenden Helm Chart auf Kubernetes zu deployen. Das Problem war jedoch, dass ich nirgends beschrieben ist was die mindest Anforderungen an die Kubernetes Umgebung ist. Nach dem deployen des Helm Chart habe ich dann bemerkt, dass eine ziemlich grosse Umgebung aufgebaut wird. Mir wurde schnell klar, dass die Umgebung auf der uns zur Verfügung gestellte Hardware (MAAS) nicht laufen wird, da etliche Pods nicht gestartet werden konnten. Ich bin dann auf einen einzelnen Container ausgewichen, damit ich weiter arbeiten und mich auf das Deployment des Businessporzess konzentrieren konnte.

## Kubernetes Cluster


## Runner

Probleme mit Personal Access Token (Classic) -> Falscher Token ausgewählt -> Fine-grained tokens wurde gewählt...

## Storageclass


## Ingress


# Lessions Learned



# Reflexion der ganzen Semesterarbeit

