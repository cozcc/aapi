# OpenAI 兼容 Base URL 与 Chat Completions

AAPI 对外公布的客户端接口是托管 Base URL 上的 OpenAI Chat Completions。

English: [openai-chat-completions.md](./openai-chat-completions.md)

## 直接复制

```text
Base URL:  https://aapi.ai/v1
Endpoint:  POST /chat/completions
Auth:      Authorization: Bearer $AAPI_API_KEY
Body:      Content-Type: application/json
Model:     https://aapi.ai/pricing 上的 model_name
```

完整地址：`https://aapi.ai/v1/chat/completions`

定价 JSON 的 `supported_endpoint.openai`（`path` 与 `method`）描述同一约定。若与本页不一致，以实时 JSON 为准：`GET https://aapi.ai/api/pricing`。

## 最小请求

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

`deepseek-v4.1-flash` 是 [`examples/curl.sh`](../examples/curl.sh) 里的示例 id。使用前到 https://aapi.ai/pricing 确认它仍是 `model_name`。`model` 可换成任意仍在列表中的 `model_name`。

## OpenAI SDK 环境变量名

```bash
export AAPI_API_KEY="your-key"          # 本仓库示例使用的名字；不要提交
export AAPI_BASE_URL="https://aapi.ai/v1"
export OPENAI_API_KEY="$AAPI_API_KEY"   # OpenAI SDK 读取的名字
export OPENAI_BASE_URL="https://aapi.ai/v1"
```

`AAPI_API_KEY` 与 `OPENAI_API_KEY` 填同一把 AAPI 密钥。参见 [`.env.example`](../.env.example) 与 [OpenAI Python 卡片](../docs/clients/openai-python.zh-CN.md)。

## 范围

已文档化的调用：使用用户 API Key 的 Chat Completions。各客户端步骤见 [接入卡片](../docs/clients/README.zh-CN.md)。模型 id 与价格见 [定价与模型列表](./pricing-and-models.zh-CN.md)。
