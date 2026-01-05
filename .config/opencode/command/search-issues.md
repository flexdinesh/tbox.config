---
description: "find issue(s) on github"
model: anthropic/claude-haiku-4-5
usage: "repo: anomalyco/opencode query: plan agent is making edits"
---

Search through existing issues in using the gh cli to find issues in repo matching query:

$ARGUMENTS

Consider:

1. Similar titles or descriptions
2. Same error messages or symptoms
3. Related functionality or components
4. Similar feature requests

Please list any matching issues with:

- Issue number and title
- Brief explanation of why it matches the query
- Link to the issue

If no clear matches are found, say so.
