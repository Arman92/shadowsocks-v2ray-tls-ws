#!/bin/bash

DOMAIN=$(grep 'DOMAIN' .env | awk -F= '{print $2}')
URL_PATH=$(grep 'URL_PATH' .env | awk -F= '{print $2}')
METHOD=$(grep 'METHOD' .env | awk -F= '{print $2}')
PASSWORD=$(grep 'PASSWORD' .env | awk -F= '{print $2}')


server_info="$METHOD:$PASSWORD@$DOMAIN:443"
plugin_info="{\"host\":\"$DOMAIN\", \"path\": \"$URL_PATH\", \"mux\": true, \"mode\": \"websocket\", \"tls\": true}"

echo -e "\n*********************\n"
echo -e "Link for Shadowrock on iOS:\n"
echo  "ss://$(echo -n $server_info | base64 -w 0 | sed -E 's/=//g')?v2ray-plugin=$(echo $plugin_info | base64 -w 0 | sed -E 's/=//g')"

echo -e "\n*********************\n"

echo -e "Link for Android and Windows clients:\n"
echo "ss://$(echo -n "$METHOD:$PASSWORD" | base64 -w 0 | sed -E 's/=//g')@$DOMAIN:443?plugin=v2ray-plugin%3Bpath%3D%2F${URL_PATH:1}%3Bhost%3D$DOMAIN%3Btls"

echo -e "\n*********************\n"
