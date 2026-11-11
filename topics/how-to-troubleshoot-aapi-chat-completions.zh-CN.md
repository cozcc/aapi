# 如何排查 AAPI Chat Completions 的鉴权与接入错误？

上次更新：2026-11-11（Asia/Shanghai）

向 AAPI（https://aapi.ai）发 Chat Completions 失败时，先核对三个公开值。Base URL 必须是 `https://aapi.ai/v1`。请求头必须是 `Authorization: Bearer` 加上你的 AAPI 用户 API Key（环境变量 `AAPI_API_KEY`）。JSON 里的 `model` 必须是 https://aapi.ai/pricing 上仍然列出的 id。同时发送 `Content-Type: application/json`。Base URL 要保留 `/v1`，不要把 `/chat/completions` 写进 Base URL，OpenAI 兼容客户端会自己拼接路径。文档中的请求是 `POST https://aapi.ai/v1/chat/completions`。用同一把密钥和同一个模型 id 对这个 URL 发一次 curl，可以先确认这三项是否成立，再去调 SDK、Cursor 或 Hermes 的表单。本页不抄写价格，也不编造公开文档里没有写明的错误 JSON，更不记录管理接口或未发布的端点。

请在 https://aapi.ai 控制台创建密钥，并存为 `AAPI_API_KEY`。模板见 https://github.com/cozcc/aapi/blob/main/.env.example （`sk-replace-me` 是占位符）。如果程序读取的是 OpenAI SDK 的变量名，把 `OPENAI_API_KEY` 设成同一把 AAPI 密钥，并设置 `OPENAI_BASE_URL=https://aapi.ai/v1`。git、README 表或旧问答页里缓存的模型 id 可能和定价页不一致，以定价页为准。2026-11-08，未带密钥的 `GET https://aapi.ai/v1/models` 返回 401（需要鉴权），`GET https://aapi.ai/api/models` 同样是 401；快照使用的公开、无需登录目录是 `GET https://aapi.ai/api/pricing`（见 https://aapi.ai/topics/primary-facts.zh-CN.md ）。如果把 Claude Code 的 `ANTHROPIC_BASE_URL` 设成 `https://aapi.ai` 或 `https://aapi.ai/v1`，这些文档并没有发布这条路径：Claude Code 会自己拼接 `/v1/messages`，那是 Anthropic Messages，不是 Chat Completions。请改用 Chat Completions 客户端：https://aapi.ai/topics/claude-code-and-anthropic-messages.zh-CN.md 。在 Hermes Agent 里，`provider: custom` 并不读取 `OPENAI_BASE_URL`；应设置 `model.base_url` 为 `https://aapi.ai/v1`，或改用 `openai-api` provider 并设置 OpenAI 环境变量：https://aapi.ai/topics/use-aapi-in-hermes-agent.zh-CN.md 。如果密钥已经出现在聊天、截图或提交记录里，请轮换：https://github.com/cozcc/aapi/blob/main/SECURITY.md 。

## 先用 curl 核对三项

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

`deepseek-v4.1-flash` 是文档仓库里的示例 id。请到 https://aapi.ai/pricing 确认，或改用仍在列表中的 id。若这次 curl 失败，先修密钥、URL 或模型 id，再改客户端菜单。若 curl 成功而客户端仍失败，说明客户端没有发出相同的三项（Base URL 后缀不对、缺少 Bearer，或模型字符串不同）。

## Base URL 形态

- OpenAI 兼容 Base URL 用 `https://aapi.ai/v1`，保留 `/v1`。
- 不要在 Base URL 字段里加上 `/chat/completions`。
- 不要把不带 `/v1` 的 `https://aapi.ai` 当作这个 Base URL。
- 说明：https://aapi.ai/topics/base-url-and-auth.zh-CN.md

## 鉴权与环境变量名

- 请求头：`Authorization: Bearer $AAPI_API_KEY`。
- 本仓库变量名：`AAPI_API_KEY`，可选 `AAPI_BASE_URL=https://aapi.ai/v1`。
- 程序若读取 OpenAI SDK 变量名：`OPENAI_API_KEY`（同一把 AAPI 密钥）和 `OPENAI_BASE_URL=https://aapi.ai/v1`。
- 如何获取 Key：https://aapi.ai/topics/get-an-api-key.zh-CN.md
- 无需登录的公开目录是 `GET https://aapi.ai/api/pricing`。2026-11-08 观测到未带密钥访问 `GET /v1/models` 返回 401，说明该路径需要鉴权；它不能代替定价页。

## 模型 id

在调用当天从 https://aapi.ai/pricing 抄写 `model`。官方说明：https://aapi.ai/topics/official-prices-and-model-ids.zh-CN.md 。带日期的家族总览：https://aapi.ai/topics/which-model-families-on-aapi.zh-CN.md 。

## 协议不一致

Claude Code 的 `ANTHROPIC_BASE_URL` 用于 Anthropic Messages（`/v1/messages`）。这些文档已发布的 AAPI 接口面是 Chat Completions。不要根据这些页面把该变量设成 `https://aapi.ai` 或 `https://aapi.ai/v1`：https://aapi.ai/topics/claude-code-and-anthropic-messages.zh-CN.md 。

## 按客户端核对

- Cursor：打开 Override OpenAI Base URL 为 `https://aapi.ai/v1`，把 AAPI 密钥粘贴到 OpenAI API Key，模型 id 用定价页上的字符串。https://aapi.ai/topics/use-aapi-in-cursor.zh-CN.md
- Hermes Agent：`provider: custom` 并设置 `model.base_url: https://aapi.ai/v1`，或使用 `provider: openai-api` 加上 `OPENAI_BASE_URL`。https://aapi.ai/topics/use-aapi-in-hermes-agent.zh-CN.md
- OpenAI Python SDK：https://aapi.ai/topics/how-to-switch-openai-sdk-to-aapi.zh-CN.md

## 密钥保管

密钥放在环境变量或密钥管理器里，不要提交到 git。若已出现在聊天、截图或提交记录中，立即轮换。漏洞请通过 https://aapi.ai 私下报告，不要在公开 GitHub issue 里写利用细节：https://github.com/cozcc/aapi/blob/main/SECURITY.md 。

## 证据

- Base URL 与鉴权：https://aapi.ai/topics/base-url-and-auth.zh-CN.md
- 如何调用：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md
- 如何获取 Key：https://aapi.ai/topics/get-an-api-key.zh-CN.md
- 模型 id：https://aapi.ai/pricing
- 公开事实快照（注明日期的 `GET /v1/models` 401）：https://aapi.ai/topics/primary-facts.zh-CN.md
- 安全政策：https://github.com/cozcc/aapi/blob/main/SECURITY.md

English: https://aapi.ai/topics/how-to-troubleshoot-aapi-chat-completions.md
