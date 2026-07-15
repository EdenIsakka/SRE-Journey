#!/bin/bash

echo "=============================="
echo "Diagnostico CachyOS"
echo "=============================="

echo -e "\n Version del Kernel:"
uname -r

echo -e "\n Uso de memoria:"
free -h | awk 'NR==2{printf "Memoria Libre: %s / Total: %s\n", $4, $2}'

echo -e "\n Espacio en Disco:"
df -h / | awk '$NF=="/"{printf "Disponible: %s / Total: %s\n", $4, $2}'

echo -e "\n==================================================="
