# OpenAI-compatible Base URL and Chat Completions

AAPI's published client API is OpenAI Chat Completions on the hosted base URL.

中文：[openai-chat-completions.zh-CN.md](./openai-chat-completions.zh-CN.md)

## Copy these

```text
Base URL:  https://aapi.ai/v1
Endpoint:  POST /chat/completions
Auth:      Authorization: Bearer $AAPI_API_KEY
Body:      Content-Type: application/json
Model:     model_name from https://aapi.ai/pricing
```

Full URL: `https://aapi.ai/v1/chat/completions`

The live pricing JSON reports the same contract under `supported_endpoint.openai` (`path` and `method`). If that object and this page disagree, follow the live JSON: `GET https://aapi.ai/api/pricing`.

## Minimal request

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

`deepseek-v4.1-flash` is the sample id in [`examples/curl.sh`](../examples/curl.sh). Confirm it is still a `model_name` on https://aapi.ai/pricing before you depend on it. Replace `model` with any other live `model_name`.

## OpenAI SDK environment names

```bash
export AAPI_API_KEY="your-key"          # name used by this repo; do not commit
export AAPI_BASE_URL="https://aapi.ai/v1"
export OPENAI_API_KEY="$AAPI_API_KEY"   # name the OpenAI SDK reads
export OPENAI_BASE_URL="https://aapi.ai/v1"
```

`AAPI_API_KEY` and `OPENAI_API_KEY` should hold the same AAPI key. See [`.env.example`](../.env.example) and the [OpenAI Python card](../docs/clients/openai-python.md).

## Scope

Documented call: Chat Completions with a user API key. Client-specific steps are in the [access cards](../docs/clients/README.md). Model ids and prices: [Pricing and model list](./pricing-and-models.md).
