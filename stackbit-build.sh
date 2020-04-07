#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e8c9afa21d8dc00133ef978/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e8c9afa21d8dc00133ef978
curl -s -X POST https://api.stackbit.com/project/5e8c9afa21d8dc00133ef978/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e8c9afa21d8dc00133ef978/webhook/build/publish > /dev/null
