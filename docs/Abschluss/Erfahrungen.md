---
layout: default
title: 5.2 Erfahrungen
parent: 5. Abschluss
nav_order: 4
---

# Gemachte Erfahrungen

In diesem Kapitel werde ich meine Semesterarbeit reflektieren.

![Erfahrungen](../ressources/bilder/verification.png){: width="250px" }

[Quelle](../Quellenverzeichnis/index.md#erfahrungen)

# Probleme

## Camunda

Ich hatte schon länger nicht mehr mit Camunda gearbeitet und musste mich nochmals kurz durch meine 2. Semesterarbeit durchlesen. Beim Versuch, mein .bpmn-File zu deployen, warf es immer Fehler aus. Nach längerer Fehlersuche habe ich dann bemerkt, dass ich eine alte Version des .bpmn-Files für das Deployen gewählt hatte (in einem falschen Pfad), weshalb es nicht funktioniert hat. Ich suchte in meinem Repo nach dem aktuellen File und habe dieses gefunden. Schlussendlich klappte dann auch das Deployen, und ich konnte mit der Arbeit weitermachen.

## Helm Chart

Ursprünglich war geplant, die gesamte Camunda-Umgebung mit einem existierenden Helm-Chart auf Kubernetes zu deployen. Das Problem war jedoch, dass nirgends beschrieben ist, welche Mindestanforderungen an die Kubernetes-Umgebung bestehen. Nach dem Deployen des Helm-Charts habe ich dann bemerkt, dass eine ziemlich grosse Umgebung aufgebaut wird. Mir wurde schnell klar, dass die Umgebung auf der uns zur Verfügung gestellten Hardware (MAAS) nicht laufen würde, da etliche Pods nicht gestartet werden konnten. Ich bin dann auf einen einzelnen Container ausgewichen, damit ich weiterarbeiten und mich auf das Deployment des Businessprozesses konzentrieren konnte.

## Runner

Damit der Arc-Runner auf meinem Kubernetes-Cluster funktioniert, musste beim Deployment ein GitHub *Personal Access Token* mitgegeben werden. Ich habe dazu folgende Anleitung befolgt: [Link](https://raw.githubusercontent.com/pstark-code/kubernetes-homelab/refs/heads/main/04-neuer-cluster/resourcen/ingress-controller-with-hostnetwork.yaml). Nach dem Erstellen des *Personal Access Token* und dem Deployen des Runners kam der "Listener"-Pod nie hoch. Ich habe dann einige Zeit gebraucht, bis ich herausgefunden habe, dass ich einen falschen Token erstellt hatte (Fine-grained Token). Nach dem Erstellen des richtigen Tokens (*Personal Access Tokens (classic)*) und dem erneuten Deployen des Runners wurde der "Listener"-Pod schlussendlich erstellt und hat sich die Pipeline-Aufgabe geholt.

## Testing

Da ich ein End-to-End-Testing machen musste, habe ich nach Tools gesucht, die mir dabei helfen. Ein ehemaliger Arbeitskollege hat mich auf Playwright aufmerksam gemacht. Das Tool lässt sich einfach in VSCode integrieren, und man kann damit schnell und einfach Testcases erstellen. Lokal hat dann alles schnell funktioniert. In der Pipeline sah das Ganze jedoch anders aus. Ich merkte, dass es Probleme gab, die Dependencies auf dem Pod zu installieren. Ich habe mich dann auf die Fehleranalyse gemacht und bemerkt, dass meine Pods immer wieder den Status *Evicted* bekamen. Auf den Nodes hatte ich zwischendurch Taints. Beim Bauen der Umgebung mit Terraform hatte ich meinen Worker-Nodes und der Control-Plane zu wenig Ressourcen gegeben. Ich musste also die gesamte Umgebung erneut bauen und habe die nötigen Terraform-Dateien angepasst. Als ich alles wieder zum Laufen brachte, konnten die Dependencies auf dem Pod installiert werden, und das Testing funktionierte.

### StorageClass

Das Erstellen der neuen Umgebung mit mehr Ressourcen war jedoch nicht alles. Der Runner hat die ganzen Dependencies vorübergehend im RAM des Worker-Nodes gespeichert, was nicht gewollt war. Ich musste deshalb noch eine StorageClass erstellen, damit der "Runner Pod" ein PVC anlegen konnte und die Dependencies darin speichern konnte. Da der Pod jedoch ein *Ephemeral Volume* anlegt, wird dieser PVC nach dem "Sterben" des Pods auch gelöscht, und der Speicher wird wieder freigegeben.

## Ingress

Ich hatte anfangs Mühe zu verstehen, wie Ingress in meinem Projekt funktionieren soll. Nach einem Gespräch mit dem Fachexperten Philipp Stark konnte ich meine Verwirrung immer mehr ablegen. Der Ingress Controller (Nginx) und das Deployment hatte ich relativ schnell zusammen. Jedoch funktionierte es nicht. Ich habe mit Philipp Stark dann das Debugging begonnen. Nach dem Ausführen von `kubectl get ingressclasses` haben wir folgendes erhalten:

```
$ kubectl get ingressclasses
NAME    CONTROLLER             PARAMETERS   AGE
nginx   k8s.io/ingress-nginx   <none>       47h
```

In meinem Ingress-Deployment hatte ich jedoch folgendes konfiguriert:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: camunda-ingress
  namespace: default
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: ingress-nginx
  rules:
  - host: cloud-hf-14-w1.maas        
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: camunda-service   
            port:
              number: 8080          
```

Die **ingressClassName** stimmte nicht. Nach der Anpassung hat dann alles sauber funktioniert. Der Grund, warum ich über den Port *30642* auf den Camunda-Service zugreifen muss, ist, weil ich bei der Ingress-Controller-Installation die Anpassung für den NodePort nicht vorgenommen habe. Philipp Stark hat mich darauf hingewiesen.

# Lessons Learned

Ich habe in dieser Semesterarbeit einiges dazugelernt, auch dass das Definieren von Zielen vor Beginn einer Arbeit sehr schwierig sein kann. Deren Definition kann einen gewaltigen Einfluss auf das Ergebnis der Arbeit haben. Ich musste leider einige Ziele anpassen, da ich erst während der Arbeit merkte, dass sie wenig Sinn machen oder gar nicht umsetzbar waren. Ich habe die [Zieldefinitionen](../Einleitung/2.2_Ziele.md) absichtlich nicht angepasst, damit man meinen Fehler sehen und ich daraus lernen kann. Dieses Mal hatte ich mehr Mühe mit der Zeit. Ich bin zwar rechtzeitig mit allem fertig geworden, hätte mir jedoch alles besser einteilen können. Ich werde bei den nächsten Arbeiten keine komplette Pause während eines Ferienblocks einlegen. Das hat bei dieser Arbeit dazu geführt, dass mein Antrieb verloren ging.

# Reflexion der gesamten Semesterarbeit

Zum Abschluss kann ich sagen, dass mir die Arbeit trotz einiger Hürden gelungen ist. Die ganze Umsetzung verlief ganz anders als erwartet. Ich habe mir das Ganze viel einfacher vorgestellt und musste während der Arbeit viele neue Wege planen. Arbeiten mit Camunda 7 werde ich zukünftig lassen. Ich hatte zu Beginn schon Mühe mit der Themenwahl, da ich nicht das Projekt des letzten Semesters für dieses Semester übernehmen wollte. Ich habe vieles dazugelernt, und das Arbeiten mit Kubernetes war sehr spannend. Das Bauen einer CI/CD-Pipeline mit GitHub Actions war ebenfalls sehr lehrreich. Ich kann mir gut vorstellen, für weitere Projekte wieder GitHub Actions zu verwenden. In Bezug auf Terraform muss ich noch einiges aufarbeiten. Während der gesamten Arbeit war ChatGPT ein guter Begleiter und hat einiges an Arbeit abgenommen.
