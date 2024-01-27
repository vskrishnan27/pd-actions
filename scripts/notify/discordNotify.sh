#!/bin/bash

# Define your webhook URL
WEBHOOK_URL='https://discord.com/api/webhooks/1200740078440415283/QlEACf-o8vnK0pWJ8-METv1pQRAeB-8yZgVFxFDvpEqvxr4dNdlANdHyVt1a25uOgiTM?name=testvalue12'

# Parse the argument (start or end)
if [ "$1" == "start" ]; then
  MESSAGE="Started"
elif [ "$1" == "end" ]; then
  MESSAGE="End"
else
  echo "Usage: $0 [start|end]"
  exit 1
fi

# Define the JSON data using the parsed message
JSON_DATA="{\"content\":\"$MESSAGE\"}"

# Set cookies if needed
COOKIES="__cfruid=a54221634e59df8abfc5e1456d3aa7b1eb5a6c8f-1706363227; _cfuvid=Xi.TLawb5QPHk9MEHJ5bfbj.FUrlR6CHyIJvHa9gk_4-1706363227510-0-604800000; __dcfduid=48377fd6bcfa11ee835f7a17eb09189e; __sdcfduid=48377fd6bcfa11ee835f7a17eb09189e466a701e37bcfb8cdff4b49f34ffcc98290f5b2e2394dda7fa62871c2c752949"

# Send the POST request using curl
curl --request POST \
  --url "$WEBHOOK_URL" \
  --header 'Content-Type: application/json' \
  --cookie "$COOKIES" \
  --data "$JSON_DATA"


echo "Notification sent to discord server"