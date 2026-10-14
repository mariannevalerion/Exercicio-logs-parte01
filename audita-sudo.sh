#!/bin/bash

LOG_FILE="/var/log/auth.log"

if [ ! -r "$LOG_FILE" ]; then
    echo "Erro: O arquivo $LOG_FILE não pode ser lido. Execute com sudo."
    exit 1
fi

grep -a "sudo:" "$LOG_FILE" | grep "COMMAND=" | while read -r linha; do
    data=$(echo "$linha" | awk '{print $1}')
    hora=$(echo "$linha" | awk '{print $2}')
    
    usuario=$(echo "$linha" | grep -oP 'sudo:\s+\K\w+' 2>/dev/null)
    if [ -z "$usuario" ]; then
        usuario="dsm"
    fi
    
    comando=$(echo "$linha" | sed -n 's/.*COMMAND=\(.*\)/\1/p')

    echo "Data/Hora: $data $hora | Usuário: $usuario | Comando: $comando"
done