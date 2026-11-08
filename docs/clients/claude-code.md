# Claude Code

Claude Code's custom base URL speaks the Anthropic Messages API. AAPI's published base URL speaks OpenAI Chat Completions. Use a Chat Completions client for AAPI.

中文：[claude-code.zh-CN.md](./claude-code.zh-CN.md)

## Card

```text
AAPI Base URL:     https://aapi.ai/v1
AAPI key env:      AAPI_API_KEY
AAPI model:        model_name from https://aapi.ai/pricing
AAPI request:      POST https://aapi.ai/v1/chat/completions
```

```text
Claude Code gateway variable: ANTHROPIC_BASE_URL
Claude Code request path:     /v1/messages
```

Official Claude Code gateway docs: a gateway selected with `ANTHROPIC_BASE_URL` implements Anthropic Messages (`/v1/messages`, optional `/v1/messages/count_tokens`). Claude Code appends `/v1/messages` itself. https://code.claude.com/docs/en/llm-gateway-protocol

AAPI's public pricing JSON lists `supported_endpoint.openai` as `POST /v1/chat/completions`. This repository does not publish an Anthropic Messages base URL. `ANTHROPIC_BASE_URL` is therefore not set to `https://aapi.ai` or `https://aapi.ai/v1` from these docs.

## Minimal working call (Chat Completions)

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

`deepseek-v4.1-flash` is a sample id. Confirm it at https://aapi.ai/pricing.

Clients that send that request:

- [Cursor](./cursor.md)
- [Hermes Agent](./hermes-agent.md)
- [curl](./curl.md)
- [OpenAI Python](./openai-python.md)
