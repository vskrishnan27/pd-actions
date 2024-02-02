curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $1" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/vskrishnan27/pd-actions/actions/workflows

echo "Invoked"  

bash $GITHUB_WORKSPACE/scripts/TriggerWorkFlowDispatch.sh "Workflow Triggered"