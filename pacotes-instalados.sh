#!/bin/bash

LOG_FILE="/var/log/dpkg.log"

if [ ! -r "$LOG_FILE" ]; then
    LOG_FILE="/var/log/dpkg.log.1"
fi

data_limite=$(date -d "1 week ago" +%Y-%m-%d)

grep "install " "$LOG_FILE" | while read -r linha; do
    data=$(echo "$linha" | awk '{print $1}')
    hora=$(echo "$linha" | awk '{print $2}')
    pacote=$(echo "$linha" | awk '{print $4}')
    
    if [[ "$data" > "$data_limite" || "$data" == "$data_limite" ]]; then
        echo "Data: $data $hora | Pacote: $pacote"
    fi
done