#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dc0304edd7fd5001a203b3e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dc0304edd7fd5001a203b3e
curl -s -X POST https://api.stackbit.com/project/5dc0304edd7fd5001a203b3e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dc0304edd7fd5001a203b3e/webhook/build/publish > /dev/null
