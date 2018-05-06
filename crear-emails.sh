#!/bin/bash

export nemail=$3
export vemail=$2
apikey=$1


export pass=$(openssl rand -base64 21)

text=$(envsubst < crear-cuenta.html)
#echo "$text"
curl -X POST --user "api:$apikey" -F login="$(echo "$nemail" | cut -d'@' -f1)" -F password="$pass" https://api.mailgun.net/v3/domains/glud.org/credentials

curl --user  "api:$apikey" https://api.mailgun.net/v3/glud.org/messages -F from="info@glud.org" \
-F to="$vemail" \
-F subject="Nueva Cuenta GLUD" \
--form-string html="$text"

curl --user  "api:$apikey" https://api.mailgun.net/v3/routes \
-F pririty=0 \
-F description="redirección para $vemail" \
-F expression="match_recipient(\"$nemail\")" \
-F action="forward(\"$vemail\")"
unset pass
