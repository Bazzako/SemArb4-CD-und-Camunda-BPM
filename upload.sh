#!/bin/bash

# Server URL
SERVER_URL="http://10.0.24.77:30000/engine-rest/deployment/create"

# Dateien zum Hochladen
FILES=(
    "C:\\Users\\dennis.buathong\\OneDrive\\Dokumente\\Gitrepos\\ITCNE23\\4.Semester\\Semesterarbeit\\SemArb4-CD-und-Camunda-BPM\\processes\\Grundgeruest.bpmn"
    "C:\\Users\\dennis.buathong\\OneDrive\\Dokumente\\Gitrepos\\ITCNE23\\4.Semester\\Semesterarbeit\\SemArb4-CD-und-Camunda-BPM\\processes\\Anmeldeformular.form"
    "C:\\Users\\dennis.buathong\\OneDrive\\Dokumente\\Gitrepos\\ITCNE23\\4.Semester\\Semesterarbeit\\SemArb4-CD-und-Camunda-BPM\\processes\\Datenerfassung.form"
    "C:\\Users\\dennis.buathong\\OneDrive\\Dokumente\\Gitrepos\\ITCNE23\\4.Semester\\Semesterarbeit\\SemArb4-CD-und-Camunda-BPM\\processes\\Datensicherung.form"
    "C:\\Users\\dennis.buathong\\OneDrive\\Dokumente\\Gitrepos\\ITCNE23\\4.Semester\\Semesterarbeit\\SemArb4-CD-und-Camunda-BPM\\processes\\Defektanalyse.form"
    "C:\\Users\\dennis.buathong\\OneDrive\\Dokumente\\Gitrepos\\ITCNE23\\4.Semester\\Semesterarbeit\\SemArb4-CD-und-Camunda-BPM\\processes\\Abholung.form"
)

# Iteriere über die Dateien und führe den curl-Befehl einzeln aus
for FILE in "${FILES[@]}"
do
    echo "Lade Datei hoch: $FILE"
    curl --location "$SERVER_URL" \
        --header 'Content-Type: multipart/form-data' \
        --form "upload=@$FILE"
    sleep 1
done

echo "Alle Dateien wurden erfolgreich hochgeladen."
