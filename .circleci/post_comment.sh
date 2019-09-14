#!/bin/bash

PR_API_URL=${echo -n ${CIRCLE_PULL_REQUEST} | sed sed -e 's_github.com_api.github.com/repos_g' -e 's/pull/issues/g' }


echo "Posting to ${PR_API_URL}"
curl --request POST \
  --url "${PR_API_URL}/comments" \
  --header 'accept: application/vnd.github.v3+json' \
  --header 'content-type: application/json' \
  -u JoachimK:${GITHUB_ACCESS_TOKEN} \
  --data "{\"body\": \"Your preview for commit \`${CIRCLE_SHA1}\` can be found here: https://circleci.com/api/v1.1/project/github/test-wik/test-wik.github.io/${CIRCLE_BUILD_NUM}/artifacts/0/site/index.html \"}"
