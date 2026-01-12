---
description: Review changes with parallel @super-review-agent subagents
---

Review uncommitted changes by default. If the user provides a pull request/merge request number or link, use CLI tools to fetch pull request information before performing your review. If a Jira ticket id is referenced in the pull request, fetch the ticket details to understand more about the problem. Use gh cli tool to fetch pull request description, the source branch and the target branch. Compare the diff between the source and target and perform the review on the unmerged changes in the branch. If the pull request description or title has a Jira ticket ID, use acli to fetch the ticket information `acli jira workitem view {id-here}` and use that information in the review.

Summarise the problem and the solution briefly before starting the review.

Review the code changes using THREE (3) @super-review-agent subagents and correlate results into a summary ranked by severity. Use the provided user guidance to steer the review and focus on specific code paths, changes, and/or areas of concern.

DO NOT EDIT, DELETE, PUSH OR MAKE ANY CODE OR GIT CHANGES. YOU ARE ONLY ALLOWED TO READ CODE or GIT CHANGES.
