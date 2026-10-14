#!/bin/bash

LOG_FILE="/var/log/auth.log"

grep -a "New session.* of user" "$LOG_FILE" | awk '{print "Data/Hora:", $1, "| Usuário:", $NF}'

