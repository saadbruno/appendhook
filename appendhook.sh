#!/bin/bash

url=$1

if [ "$url" = "none" ]; then
  echo ":: WARNING: No webhook URL was set. Please set it using the WEBHOOK_URL environment variable"
fi

echo "Starting appendhook script v0.1.3 with the following info:"
echo ":: URL: $url"

function webhook() {
    curl -H "Content-Type: application/json" \
        -X POST \
        -d "$1" $url
}


tail -n 0 -F ./watchfile | while read line; do

    filtered=$(jo content="$line")
    echo "Sending webhook with the following content: $filtered"

    webhook "$filtered"

done