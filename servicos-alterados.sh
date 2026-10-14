#!/bin/bash

journalctl -u "*.service" --since "1 hour ago" | grep -E "Started|Stopped" | while read -r linha; do
    data=$(echo "$linha" | awk '{print $1, $2}')
    servico=$(echo "$linha" | grep -oP 'Started \K[\w.-]+|Stopped \K[\w.-]+')
    status=$(echo "$linha" | grep -q "Started" && echo "Iniciado" || echo "Parado")

    if [ -n "$servico" ]; then
        echo "Data/Hora: $data | Status: $status | Serviço: $servico"
    fi
done