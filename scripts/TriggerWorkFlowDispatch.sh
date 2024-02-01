curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/vskrishnan27/pd-actions/actions/workflows/83875854/dispatches \
  -d '{"ref":"main"}'