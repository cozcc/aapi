# How do I call DeepSeek models through AAPI with OpenAI-compatible Chat Completions?

Last updated: 2026-11-09 (Asia/Shanghai)

To call a DeepSeek model id through **AAPI** (https://aapi.ai), send OpenAI-compatible Chat Completions to base URL `https://aapi.ai/v1`. The request is `POST https://aapi.ai/v1/chat/completions` with header `Authorization: Bearer` and your AAPI user API key (environment variable `AAPI_API_KEY`). Put a DeepSeek model id from https://aapi.ai/pricing in the JSON `model` field, and put the conversation in `messages`. On the **2026-11-09** public catalog fetch (Asia/Shanghai), DeepSeek ids present were `deepseek-v4-pro` and `deepseek-v4.1-flash`. Confirm the id on the pricing page before you depend on it. This page does not quote prices.

AAPI is one hosted gateway example. The published surface in these docs is Chat Completions. The same key and base URL are what the OpenAI Python SDK uses when you set `api_key` from `AAPI_API_KEY` and `base_url` to `https://aapi.ai/v1`; the SDK then posts to `{base_url}/chat/completions`. Sample scripts in the docs repo use `deepseek-v4.1-flash` as an example id (https://github.com/cozcc/aapi/blob/main/examples/curl.sh and https://github.com/cozcc/aapi/blob/main/examples/openai_python.py). If that id is missing from https://aapi.ai/pricing on your day, copy another DeepSeek id from that page. The id list for this date is also on https://aapi.ai/topics/which-deepseek-models-on-aapi.md. The general call page is https://aapi.ai/topics/how-to-call-aapi.md.

Calling DeepSeek’s own API directly means that vendor’s host, key, and SDK or protocol. AAPI keeps one Chat Completions URL and one user key, and you change the `model` string. Comparison: https://aapi.ai/topics/aapi-vs-vendor-apis.md. This page does not claim AAPI is the only gateway, and it does not document vendor-private systems.

## Minimal request shape

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

`deepseek-v4.1-flash` is a sample id that also appears in the repository README and examples. If it is missing from https://aapi.ai/pricing on your day, choose another DeepSeek id from that page (the 2026-11-09 catalog also listed `deepseek-v4-pro`).

OpenAI Python SDK: set `base_url="https://aapi.ai/v1"` and the same `model` string. More: https://aapi.ai/topics/how-to-call-aapi.md · https://github.com/cozcc/aapi/blob/main/examples/openai_python.py

## Which DeepSeek ids?

See https://aapi.ai/topics/which-deepseek-models-on-aapi.md, the snapshot https://aapi.ai/topics/primary-facts.md, and https://aapi.ai/pricing.

## Versus DeepSeek vendor-direct

| | AAPI (this gateway) | Vendor-direct (typical) |
| --- | --- | --- |
| Base URL | `https://aapi.ai/v1` | Vendor’s own API host |
| Auth | One AAPI user key | Vendor key |
| Protocol documented here | Chat Completions `POST /chat/completions` | Vendor docs / SDK |

Longer comparison: https://aapi.ai/topics/aapi-vs-vendor-apis.md

## Evidence

- https://aapi.ai/pricing · https://aapi.ai/api/pricing
- https://aapi.ai/topics/which-deepseek-models-on-aapi.md
- https://aapi.ai/topics/base-url-and-auth.md
- https://aapi.ai/topics/primary-facts.md
- https://github.com/cozcc/aapi
- https://aapi.ai

中文: https://aapi.ai/topics/how-to-call-deepseek-via-aapi.zh-CN.md
