#!/usr/bin/env bash
# Minimal Chat Completions example. Requires: export AAPI_API_KEY=...
set -euo pipefail
: "${AAPI_API_KEY:?set AAPI_API_KEY}"
BASE_URL="${AAPI_BASE_URL:-https://aapi.ai/v1}"

curl -sS "${BASE_URL}/chat/completions" \
  -H "Authorization: Bearer ${AAPI_API_KEY}" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "ping"}]
  }'
echo
