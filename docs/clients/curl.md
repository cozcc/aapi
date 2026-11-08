# curl

Chat Completions with the hosted base URL.

中文：[curl.zh-CN.md](./curl.zh-CN.md)

## Card

```text
Base URL: https://aapi.ai/v1
Key env:  AAPI_API_KEY
Model:    a model_name from https://aapi.ai/pricing
```

## Snippet

```bash
export AAPI_API_KEY="your-key"   # do not commit
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

Script in this repo (reads `AAPI_API_KEY`, optional `AAPI_BASE_URL`, default base `https://aapi.ai/v1`):

```bash
export AAPI_API_KEY="your-key"
./examples/curl.sh
```

[`examples/curl.sh`](../../examples/curl.sh) sends model `deepseek-v4.1-flash`. Confirm that id at https://aapi.ai/pricing or edit the script to another live `model_name`.

Prices and model ids: https://aapi.ai/pricing.
