#!/bin/bash

PR_API_URL="$(echo -n ${CIRCLE_PULL_REQUEST} | sed -e 's_github.com_api.github.com/repos_g' -e 's/pull/issues/g')"


echo "Posting to ${PR_API_URL}"
curl --request POST \
  --url "${PR_API_URL}/comments" \
  --header 'accept: application/vnd.github.v3+json' \
  --header 'content-type: application/json' \
  -u JoachimK:${GITHUB_ACCESS_TOKEN} \
  --data "{\"body\": \"Deine Vorschau für deinen Commit ${CIRCLE_SHA1} findest du hier: https://preview.stadtteilgenossenschaft-wik.de/${CIRCLE_BUILD_NUM}/ \"}"
