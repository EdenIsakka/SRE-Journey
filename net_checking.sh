#!/bin/bash 

echo "==========================="
echo " Networking Health Check "
echo "==========================="

DOMAINS=("google.com" "github.com" "cachyos.org" "este-dominio-no-existe.com")

echo "Haciendo ping a los endpoints.."
echo ""

for domain in "${DOMAINS[@]}"; do

	HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://$domain --max-time 3)
	
	if [ "$HTTP_CODE" == "200" ]; then 
		echo "$domain esta online(HTTP 200 - OK)"
	elif [ "$HTTP_CODE" == "000" ]; then
		echo "$domain esta Offline (Inalcanzable o error de DNS)"
	else
		echo "$domain respondio con un codigo (HTTP $HTTP_CODE)"
	fi

done

echo ""
echo "===================================================================="
