#!/bin/bash

response=$(curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $1" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/vskrishnan27/pd-actions/actions/workflows/83875854/dispatches \
  -d '{"ref":"main"}')

Msg_to_send="Workflow Dispatch Triggered..."

if echo "$response" | grep -i -q "bad cred"; then
    Msg_to_send="Failed to trigger the workflow, please check your Github token. - bad"
elif echo "$response" | grep -i -q "failed"; then
    Msg_to_send="Failed to trigger the workflow, please check your Github token. - failed" 
fi
