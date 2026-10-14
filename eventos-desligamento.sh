last -x | grep -E "shutdown|runlevel" | while read -r linha; do
    status=$(echo "$linha" | awk '{print $1}')
    data_dia=$(echo "$linha" | awk '{print $5, $6, $7}')
    hora=$(echo "$linha" | awk '{print $8}')

    if [ "$status" = "shutdown" ]; then
        echo "Tipo: Desligamento | Data: $data_dia | Hora: $hora"
    elif [[ "$linha" =~ "down" ]]; then
        echo "Tipo: Sistema Desligado | Data: $data_dia | Hora: $hora"
    fi
done

