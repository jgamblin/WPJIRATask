#!/bin/bash
url="$1"
newestwp=$(curl -sSL http://api.wordpress.org/core/version-check/1.7 | jq -r .offers[0].current)
runningwp=$(curl -s -N $url | grep 'wp-embed.min.js?ver=' | sed 's:.*=::' | cut -c1-5)

if [ "$newestwp" == "$runningwp" ] ; then
  printf "%s is running Wordpress %s. Which is the newst version.\n" "$url" "$newestwp"
else
  printf "%s is out of date. You are running %s and %s is the latest version.\n" "$url" "$runningwp" "$newestwp"
fi
