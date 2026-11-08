# 客户端接入卡片

所有 OpenAI 兼容客户端共用下面的值。分客户端步骤在 [docs/clients/](../docs/clients/README.zh-CN.md)。

English: [client-setup.md](./client-setup.md)

```text
Base URL: https://aapi.ai/v1
Key 环境变量: AAPI_API_KEY
Model:    https://aapi.ai/pricing 上的 model_name
          或 GET https://aapi.ai/api/pricing 里的 data[].model_name
```

OpenAI SDK 也可以用它自己的变量名指向同一把密钥和同一个 URL：

```text
OPENAI_BASE_URL=https://aapi.ai/v1
OPENAI_API_KEY=$AAPI_API_KEY
```

## 卡片

| 客户端 | 卡片 | 是否直接使用 AAPI 的 Chat Completions URL |
| --- | --- | --- |
| Cursor | [cursor.zh-CN.md](../docs/clients/cursor.zh-CN.md) | 是。Override OpenAI Base URL。 |
| Hermes Agent | [hermes-agent.zh-CN.md](../docs/clients/hermes-agent.zh-CN.md) | 是。自定义端点，provider `custom`。 |
| curl | [curl.zh-CN.md](../docs/clients/curl.zh-CN.md) | 是。 |
| OpenAI Python | [openai-python.zh-CN.md](../docs/clients/openai-python.zh-CN.md) | 是。 |
| Claude Code | [claude-code.zh-CN.md](../docs/clients/claude-code.zh-CN.md) | 否。Claude Code 的 `ANTHROPIC_BASE_URL` 走 Anthropic Messages（`/v1/messages`）。请用上面的 Chat Completions 卡片。 |

在 https://aapi.ai 注册并创建密钥。密钥放在环境变量或客户端的密钥栏。[`.env.example`](../.env.example) 里的占位符是 `sk-replace-me`。
