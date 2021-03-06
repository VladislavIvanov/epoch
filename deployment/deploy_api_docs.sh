#!/bin/bash

set -e

git clone git@github.com:aeternity/epoch-api-docs.git /tmp/epoch-api-docs
cp apps/aehttp/priv/swagger.json /tmp/epoch-api-docs/
cd /tmp/epoch-api-docs/

git add swagger.json;
STATUS=`git status --porcelain`

if [ -z "$STATUS" ]; then
    echo "Nothing to commit, docs did not change";
else
    git config user.name "CircleCI"
    git config user.email "circleci@aeternity.com"
    git commit -a -m "Update epoch version: $CIRCLE_TAG docs CircleCI";
    git push origin master
fi
