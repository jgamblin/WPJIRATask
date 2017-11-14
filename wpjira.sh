#!/bin/bash
url=""
jiraurl=""
jirausername=""
jirapassword=""
newestwp=$(curl -sSL http://api.wordpress.org/core/version-check/1.7 | jq -r .offers[0].current)
runningwp=$(curl -s -N $url | grep 'wp-embed.min.js?ver=' | sed 's:.*=::' | cut -c1-5)

if [ "$newestwp" == "$runningwp" ] ; then
  printf "You are running Wordpress %s. Which is the newst Version.\n" "$newestwp"
  sleep 3600
else
  curl -D- -u $jirausername:$jirapassword -X POST --data '{"fields":{"project":{"key": "CFXSEC"},"summary": "Wordpress is Out Of Date","description": "'$URL' is running '$runningwp' and '$newestwp' is the latest version.","issuetype": {"name": "Story"}}}' -H "Content-Type: application/json" $jiraurl
  sleep 604800
fi
