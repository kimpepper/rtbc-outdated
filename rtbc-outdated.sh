#!/bin/bash
VERSION=8.8.x-dev
LIMIT=20
API_URL="https://www.drupal.org/api-d7/node.json?type=project_issue&field_project=3060&field_issue_version=$VERSION&field_issue_status=14&limit=$LIMIT&sort=field_issue_last_status_change&direction=ASC&page=0"
DAYS_AGO=28
TIMESTAMP=$((`date '+%s'` - (86400 * $DAYS_AGO)))

curl -sSL -o- $API_URL | jq -r ".list[] | select(.changed | tonumber <= $TIMESTAMP) .url"
