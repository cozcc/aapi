# Client setup cards

Shared values for every OpenAI-compatible client. Per-client steps live in [docs/clients/](../docs/clients/README.md).

中文：[client-setup.zh-CN.md](./client-setup.zh-CN.md)

```text
Base URL: https://aapi.ai/v1
Key env:  AAPI_API_KEY
Model:    model_name from https://aapi.ai/pricing
          or data[].model_name in GET https://aapi.ai/api/pricing
```

OpenAI SDK clients can use the same key and URL under the SDK's own names:

```text
OPENAI_BASE_URL=https://aapi.ai/v1
OPENAI_API_KEY=$AAPI_API_KEY
```

## Cards

| Client | Card | Fits AAPI's Chat Completions URL |
| --- | --- | --- |
| Cursor | [cursor.md](../docs/clients/cursor.md) | Yes. Override OpenAI Base URL. |
| Hermes Agent | [hermes-agent.md](../docs/clients/hermes-agent.md) | Yes. Custom endpoint, provider `custom`. |
| curl | [curl.md](../docs/clients/curl.md) | Yes. |
| OpenAI Python | [openai-python.md](../docs/clients/openai-python.md) | Yes. |
| Claude Code | [claude-code.md](../docs/clients/claude-code.md) | No. Claude Code's `ANTHROPIC_BASE_URL` speaks Anthropic Messages (`/v1/messages`). Use one of the Chat Completions cards above. |

Sign up and create a key at https://aapi.ai. Keep the key in an environment variable or the client's secret field. The placeholder in [`.env.example`](../.env.example) is `sk-replace-me`.
