# AAPI 支持 Claude Code / Anthropic Messages 吗？

本仓库为 AAPI 公布的接口是 OpenAI 兼容的 Chat Completions。请求是 POST https://aapi.ai/v1/chat/completions，Base URL 是 https://aapi.ai/v1，请求头是 `Authorization: Bearer`，密钥放在 `AAPI_API_KEY`。Claude Code 的自定义网关变量是 `ANTHROPIC_BASE_URL`。Claude Code 自己的网关文档写明：用该变量选中的网关实现 Anthropic Messages，其中包括 `/v1/messages`，并且 `/v1/messages` 由 Claude Code 自己拼接：https://code.claude.com/docs/en/llm-gateway-protocol。Anthropic Messages 和 OpenAI Chat Completions 是不同的请求路径，也是不同的 JSON 正文。这些 AAPI 文档公布的是 Chat Completions 的 URL。客户端卡片里没有为 AAPI 公布 Anthropic Messages 的 Base URL，因此这些文档不为 AAPI 设置 `ANTHROPIC_BASE_URL`，也不会把它写成 `https://aapi.ai` 或 `https://aapi.ai/v1`。https://aapi.ai/pricing 上的某个模型 id 可能带有 Claude 风格的名字。当定价页列出该 id 时，你可以从 curl、OpenAI Python SDK、Cursor 的 OpenAI Base URL 覆盖，或 Hermes Agent 的自定义端点，把它放进 Chat Completions 的 `model`。这次调用仍然是 Chat Completions。客户端卡片 https://github.com/cozcc/aapi/blob/main/docs/clients/claude-code.zh-CN.md 说明的就是这一协议，并让需要 AAPI 的 Claude Code 用户改用这些 Chat Completions 客户端。如果你的工具只能发送 `/v1/messages`，已公布的 AAPI 文档停在 Chat Completions，其中给出的可用路径是上述客户端之一。

## 依据

- Claude Code 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/claude-code.zh-CN.md
- Claude Code 网关协议：https://code.claude.com/docs/en/llm-gateway-protocol
- Chat Completions 调用：https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md
- Cursor 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/cursor.zh-CN.md
- 模型 id：https://aapi.ai/pricing

English: https://github.com/cozcc/aapi/blob/main/topics/claude-code-and-anthropic-messages.md
