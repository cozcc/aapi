# Pricing and model list

Read prices and the model catalog from the official pages at request time. This repository does not store USD amounts.

中文：[pricing-and-models.zh-CN.md](./pricing-and-models.zh-CN.md)

## Official sources

- Human page: https://aapi.ai/pricing
- JSON, no account: `GET https://aapi.ai/api/pricing`

```bash
curl -sS https://aapi.ai/api/pricing
```

## What to put in `model`

Each object in the JSON array `data` has a `model_name` string. That string is the Chat Completions `model` value.

```text
POST https://aapi.ai/v1/chat/completions
{"model": "<data[].model_name>", "messages": [{"role": "user", "content": "Hello"}]}
```

Client setup needs `model_name` only. Leave billing expressions, vendor ids, and group ids in the JSON response; they are not request fields.

`supported_endpoint.openai` on the same payload names the Chat Completions path and method. The path is on the host: `POST https://aapi.ai/v1/chat/completions`. OpenAI clients set the base URL to `https://aapi.ai/v1` and append `/chat/completions`. If the live object changes, follow the live object.

## Sample id in this repo

[`examples/`](../examples/) and the root README send `deepseek-v4.1-flash`. Treat it as a sample. If it is missing from https://aapi.ai/pricing, choose another `model_name` from that response.

How to call the endpoint: [OpenAI-compatible Base URL and Chat Completions](./openai-chat-completions.md).
