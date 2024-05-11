#!/bin/bash

# Define your webhook URL
# WEBHOOK_URL='https://discord.com/api/webhooks/1200740078440415283/QlEACf-o8vnK0pWJ8-METv1pQRAeB-8yZgVFxFDvpEqvxr4dNdlANdHyVt1a25uOgiTM?name=testvalue12'
WEBHOOK_URL="https://cliq.zoho.com/company/64396901/api/v2/channelsbyname/webhookq/message?zapikey=1001.84b664eb7a45c0bd43c3d12a0cf04d90.bef5722b3a27ef64b052122e4a151dd7"

# Parse the argument (start or end)
if [ "$1" == "start" ]; then
  MESSAGE="Started ::: ${{github.run_id}}"
elif [ "$1" == "end" ]; then
  MESSAGE="End ::: ${{github.run_id}}"
else
  MESSAGE="$1"
fi

echo $MESSAGE

# Define the JSON data using the parsed message
JSON_DATA="{\"text\":\"$MESSAGE\"}"

echo $JSON_DATA

# Set cookies if needed
COOKIES="__cfruid=a54221634e59df8abfc5e1456d3aa7b1eb5a6c8f-1706363227; _cfuvid=Xi.TLawb5QPHk9MEHJ5bfbj.FUrlR6CHyIJvHa9gk_4-1706363227510-0-604800000; __dcfduid=48377fd6bcfa11ee835f7a17eb09189e; __sdcfduid=48377fd6bcfa11ee835f7a17eb09189e466a701e37bcfb8cdff4b49f34ffcc98290f5b2e2394dda7fa62871c2c752949"

# Send the POST request using curl
curl --request POST \
  --url "$WEBHOOK_URL" \
  --header 'Content-Type: application/json' \
  --cookie "$COOKIES" \
  --data "$JSON_DATA"

echo "Notification sent to discord server"