# 如何在 Hermes Agent 里使用 AAPI？

上次更新：2026-11-11（Asia/Shanghai）

在 Hermes Agent 里使用 AAPI（https://aapi.ai），是把 Chat Completions 自定义端点指向 Base URL `https://aapi.ai/v1`。当 provider 为 `custom` 时，Hermes 会请求 `POST {base_url}/chat/completions`。Base URL 要保留末尾的 `/v1`，不要在这个字段里加上 `/chat/completions`，路径由 Hermes 拼接。鉴权使用你的 AAPI 用户 API Key（环境变量 `AAPI_API_KEY`）。优先写 Hermes 的 `key_env: AAPI_API_KEY`，不要把密钥写进 `config.yaml`。模型名必须与 https://aapi.ai/pricing 上的某个 `model_name` 逐字相同。请先在 https://aapi.ai 控制台创建密钥，不要提交到 git。文档仓库的示例 id 是 `deepseek-v4.1-flash`。依赖前请到定价页确认；如果页面已经更换，就改用仍在列表中的 id。本页不抄写价格。这些文档已发布的接口面是 Chat Completions，不是 Anthropic Messages。

也可以用 `hermes model` 交互填写这三项：选择 Custom endpoint (self-hosted / VLLM / etc.)，API base URL 填 `https://aapi.ai/v1`，在提示时粘贴 AAPI 密钥（不要提交到 git），Model name 填当天仍在定价页上的 id。对应到 `~/.hermes/config.yaml`，字段是 `model.provider: custom`、`model.base_url: https://aapi.ai/v1`、`model.key_env: AAPI_API_KEY`，以及 `model.default` 等于该 id，并在环境中导出 `AAPI_API_KEY`。`provider: custom` 并不读取 `OPENAI_BASE_URL`。Hermes 只在 `openai-api` provider 上使用 `OPENAI_BASE_URL`。若走这种写法，把同一把 AAPI 密钥放到 `OPENAI_API_KEY`，并在 `~/.hermes/.env` 里设置 `OPENAI_BASE_URL=https://aapi.ai/v1`（不要提交）。两种写法最终都是 `POST https://aapi.ai/v1/chat/completions`。用同一把密钥和同一个模型 id 对这个 URL 发一次 curl，可以先确认这三项，再去看 Hermes 的配置。可复制的卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/hermes-agent.zh-CN.md 。Hermes 的提供方说明：https://hermes-agent.nousresearch.com/docs/integrations/providers 。Cursor 是单独一页：https://aapi.ai/topics/use-aapi-in-cursor.zh-CN.md 。Claude Code 的 `ANTHROPIC_BASE_URL` 走 Anthropic Messages，这些文档不会把它设成 AAPI：https://aapi.ai/topics/claude-code-and-anthropic-messages.zh-CN.md 。

## 交互式配置

```text
hermes model
# 选择：Custom endpoint (self-hosted / VLLM / etc.)
# API base URL: https://aapi.ai/v1
# API key: AAPI_API_KEY 的值（只在提示时粘贴；不要提交）
# Model name: deepseek-v4.1-flash
```

`deepseek-v4.1-flash` 是仓库里的示例 id。请到 https://aapi.ai/pricing 确认，或改用该页上的其他 id。

## `config.yaml`（密钥留在环境变量）

`~/.hermes/config.yaml`：

```yaml
model:
  default: deepseek-v4.1-flash
  provider: custom
  base_url: https://aapi.ai/v1
  key_env: AAPI_API_KEY
```

```bash
export AAPI_API_KEY="your-key"
```

Hermes 文档把 `key_env` 写成写入 `api_key` 的替代。优先用 `key_env`。

## 另一种：`openai-api` provider

同一 Chat Completions URL，走 Hermes 为 `openai-api` 读取的 OpenAI SDK 变量名：

```yaml
model:
  default: deepseek-v4.1-flash
  provider: openai-api
```

```bash
# ~/.hermes/.env — 不要提交
OPENAI_BASE_URL=https://aapi.ai/v1
OPENAI_API_KEY=your-key
```

这里的 `OPENAI_API_KEY` 就是 AAPI 密钥，与 `AAPI_API_KEY` 相同。

## 自检

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

另见 https://github.com/cozcc/aapi/blob/main/examples/curl.sh 与 https://aapi.ai/topics/how-to-call-aapi.zh-CN.md 。

## 证据

```text
Base URL: https://aapi.ai/v1
Key:      AAPI_API_KEY（Hermes key_env）；provider 为 openai-api 时用 OPENAI_API_KEY
Model:    https://aapi.ai/pricing 上的 id
```

- Hermes Agent 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/hermes-agent.zh-CN.md
- 客户端索引：https://github.com/cozcc/aapi/blob/main/docs/clients/README.zh-CN.md
- Hermes 提供方说明：https://hermes-agent.nousresearch.com/docs/integrations/providers
- 模型 id：https://aapi.ai/pricing
- Cursor（另一客户端）：https://aapi.ai/topics/use-aapi-in-cursor.zh-CN.md
- Claude Code / Anthropic Messages 说明：https://aapi.ai/topics/claude-code-and-anthropic-messages.zh-CN.md

English: https://aapi.ai/topics/use-aapi-in-hermes-agent.md
