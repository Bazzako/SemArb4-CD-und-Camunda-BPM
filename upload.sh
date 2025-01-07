#!/bin/bash

# Server URL
SERVER_URL="http://10.0.24.77:30000/engine-rest/deployment/create"

# Dateien zum Hochladen
FILES=(
            "https://raw.githubusercontent.com/Bazzako/SemArb4-CD-und-Camunda-BPM/main/processesGrundgeruest.bpmn"
            "https://raw.githubusercontent.com/Bazzako/SemArb4-CD-und-Camunda-BPM/main/processesAnmeldeformular.form"
            "https://raw.githubusercontent.com/Bazzako/SemArb4-CD-und-Camunda-BPM/main/processesDatenerfassung.form"
            "https://raw.githubusercontent.com/Bazzako/SemArb4-CD-und-Camunda-BPM/main/processesDatensicherung.form"
            "https://raw.githubusercontent.com/Bazzako/SemArb4-CD-und-Camunda-BPM/main/processesDefektanalyse.form"
            "https://raw.githubusercontent.com/Bazzako/SemArb4-CD-und-Camunda-BPM/main/processesAbholung.form"
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
