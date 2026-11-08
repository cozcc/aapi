# Claude Code

Claude Code 的自定义 Base URL 使用 Anthropic Messages API。AAPI 公布的 Base URL 使用 OpenAI Chat Completions。调用 AAPI 时用 Chat Completions 客户端。

English: [claude-code.md](./claude-code.md)

## 卡片

```text
AAPI Base URL: https://aapi.ai/v1
AAPI Key 环境变量: AAPI_API_KEY
AAPI Model:    https://aapi.ai/pricing 上的 model_name
AAPI 请求:     POST https://aapi.ai/v1/chat/completions
```

```text
Claude Code 网关变量: ANTHROPIC_BASE_URL
Claude Code 请求路径: /v1/messages
```

Claude Code 官方网关文档：用 `ANTHROPIC_BASE_URL` 指向的网关实现 Anthropic Messages（`/v1/messages`，可选 `/v1/messages/count_tokens`）。`/v1/messages` 由 Claude Code 自己拼接。https://code.claude.com/docs/en/llm-gateway-protocol

AAPI 公开定价 JSON 里，`supported_endpoint.openai` 为 `POST /v1/chat/completions`。本仓库没有公布 Anthropic Messages 的 Base URL。因此这些文档不会把 `ANTHROPIC_BASE_URL` 设为 `https://aapi.ai` 或 `https://aapi.ai/v1`。

## 最小可用调用（Chat Completions）

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

`deepseek-v4.1-flash` 是示例 id。以 https://aapi.ai/pricing 为准。

会发送该请求的客户端：

- [Cursor](./cursor.zh-CN.md)
- [Hermes Agent](./hermes-agent.zh-CN.md)
- [curl](./curl.zh-CN.md)
- [OpenAI Python](./openai-python.zh-CN.md)
