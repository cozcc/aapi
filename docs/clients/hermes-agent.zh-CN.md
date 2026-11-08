# Hermes Agent

自定义 OpenAI 兼容端点。provider 为 `custom` 时，Hermes 请求 `POST {base_url}/chat/completions`。

English: [hermes-agent.md](./hermes-agent.md)

提供方说明：https://hermes-agent.nousresearch.com/docs/integrations/providers

## 卡片

```text
Base URL: https://aapi.ai/v1
Key 环境变量: AAPI_API_KEY
Model:    https://aapi.ai/pricing 上的 model_name
```

本仓库示例模型 id：`deepseek-v4.1-flash`。以定价页为准。

## 交互式配置

```text
hermes model
# 选择：Custom endpoint (self-hosted / VLLM / etc.)
# API base URL: https://aapi.ai/v1
# API key: AAPI_API_KEY 的值（只在提示时粘贴；不要提交）
# Model name: deepseek-v4.1-flash
```

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

`provider: custom` 不看 `OPENAI_BASE_URL`。Hermes 只在 `openai-api` provider 上使用 `OPENAI_BASE_URL`。自定义端点请按上面设置 `model.base_url`（或在 `hermes model` 里填写 URL）。

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

另见 [`examples/curl.sh`](../../examples/curl.sh)。
