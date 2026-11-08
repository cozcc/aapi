# Pricing and model list

Read model ids and official list prices from the live pricing page. This repository does not store USD amounts.

中文：[pricing-and-models.zh-CN.md](./pricing-and-models.zh-CN.md)

## Official source

- https://aapi.ai/pricing

Copy the model id shown there into the Chat Completions `model` field.

```text
POST https://aapi.ai/v1/chat/completions
{"model": "<id from https://aapi.ai/pricing>", "messages": [{"role": "user", "content": "Hello"}]}
```

OpenAI clients set the base URL to `https://aapi.ai/v1` and call `/chat/completions`. Request shape: [OpenAI-compatible Base URL and Chat Completions](./openai-chat-completions.md).

## Sample id in this repo

[`examples/`](../examples/) and the root README send `deepseek-v4.1-flash`. Treat it as a sample. If it is missing from https://aapi.ai/pricing, choose another id from that page.
