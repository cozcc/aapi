# Client access cards

Copy-paste setup for OpenAI-compatible clients. One card per client. No secrets.

中文：[README.zh-CN.md](./README.zh-CN.md) · Topic overview: [topics/client-setup.md](../../topics/client-setup.md)

## Shared card

```text
Base URL: https://aapi.ai/v1
Key env:  AAPI_API_KEY
Model:    an id from https://aapi.ai/pricing
```

OpenAI SDK name pair (same key, same URL):

```text
OPENAI_BASE_URL=https://aapi.ai/v1
OPENAI_API_KEY=$AAPI_API_KEY
```

Create the key at https://aapi.ai. Template: [`.env.example`](../../.env.example).

Sample `model` used in [`examples/`](../../examples/): `deepseek-v4.1-flash`. Confirm it on the live pricing page before you depend on it.

## Cards

- [Cursor](./cursor.md) — Settings → Models, Override OpenAI Base URL
- [Hermes Agent](./hermes-agent.md) — custom OpenAI-compatible endpoint
- [CC Switch](./cc-switch.md) — custom-fill `https://aapi.ai/v1`; not a built-in preset
- [All API Hub](./all-api-hub.md) — credentials library Base URL `https://aapi.ai/v1`; account form uses site root `https://aapi.ai`
- [curl](./curl.md) — `examples/curl.sh`
- [OpenAI Python](./openai-python.md) — `examples/openai_python.py`
- [Claude Code](./claude-code.md) — Anthropic Messages client; this Chat Completions URL is a different protocol

Chat Completions request shape: [topics/openai-chat-completions.md](../../topics/openai-chat-completions.md).
