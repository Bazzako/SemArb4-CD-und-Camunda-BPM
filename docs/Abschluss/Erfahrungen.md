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

### Helm Chart

Ursprünglich war geplant die gesammte Camunda Umgebung mit einem existierenden Helm Chart auf Kubernetes zu deployen. Das Problem war jedoch, dass ich nirgends beschrieben ist was die mindest Anforderungen an die Kubernetes Umgebung ist. Nach dem deployen des Helm Chart habe ich dann bemerkt, dass eine ziemlich grosse Umgebung aufgebaut wird. Mir wurde schnell klar, dass die Umgebung auf der uns zur Verfügung gestellte Hardware (MAAS) nicht laufen wird, da etliche Pods nicht gestartet werden konnten. Ich bin dann auf einen einzelnen Container ausgewichen, damit ich weiter arbeiten und mich auf das Deployment des Businessporzess konzentrieren konnte.

### Skalierbarkeit

Da ich eine bestehende Softwarelösung in meine Arbeit miteinbezogen habe und den Quellcode nicht kenne, konnte ich nicht von anfang an sagen, ob die Software skalierbar ist. Ich bin mit der Annahme an die Arbeit, dass das Helm Chart eine skalierbare Umgebung aufbauen würde. Mir fehlt jetzt das Know How über die Software dass ich diese redundant und skalierbar aufbauen könnte. Nach Absprache mit dem Kursleiter Marcel Bernet ist es für diese Arbeit genug, wenn ich jetzt mit einem einzelnen Container oder Pod im Kubernetes arbeite.

## Kubernetes Cluster



# Lessions Learned



# Reflexion der ganzen Semesterarbeit

