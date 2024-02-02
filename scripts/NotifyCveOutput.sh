#!/bin/bash

WEBHOOK_URL='https://discord.com/api/webhooks/1200740078440415283/QlEACf-o8vnK0pWJ8-METv1pQRAeB-8yZgVFxFDvpEqvxr4dNdlANdHyVt1a25uOgiTM?name=testvalue12'
# Prepare the message content by escaping special characters and formatting as JSON
PATH="../output/"

messageContent=$(sed 's/"/\\"/g' ../output/nuclei_output.txt | jq -R '{content: .}')

echo "$messageContent"

# Send the JSON payload to Discord
curl -H "Content-Type: application/json" \
     -d "$messageContent" \
    -url "$WEBHOOK_URL"
