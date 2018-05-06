#!/bin/bash

apikey=$1
infile=$2
from=$3

while read email
do
export text=$(envsubst < $infile)

curl --user  "api:$apikey" https://api.mailgun.net/v3/glud.org/messages -F from="$from" \
 -F to="$email" \
 -F subject="Hackathon Semana de Ingeniería Universidad Distrital" \
 --form-string html="$text" \
 -F o:tag='hackathon' \
 -F o:tag='semana' \
 -F o:tag='ingenieria'
done < /dev/stdin

