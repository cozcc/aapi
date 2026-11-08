# curl

用托管 Base URL 调用 Chat Completions。

English: [curl.md](./curl.md)

## 卡片

```text
Base URL: https://aapi.ai/v1
Key 环境变量: AAPI_API_KEY
Model:    https://aapi.ai/pricing 上的 model_name
```

## 片段

```bash
export AAPI_API_KEY="your-key"   # 不要提交
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

本仓库脚本（读取 `AAPI_API_KEY`，可选 `AAPI_BASE_URL`，默认 Base URL 为 `https://aapi.ai/v1`）：

```bash
export AAPI_API_KEY="your-key"
./examples/curl.sh
```

[`examples/curl.sh`](../../examples/curl.sh) 发送的模型是 `deepseek-v4.1-flash`。到 https://aapi.ai/pricing 确认该 id，或把脚本改成另一个仍在列表中的 `model_name`。

价格：https://aapi.ai/pricing · `GET https://aapi.ai/api/pricing`。填进 `model` 的字段是 `data[].model_name`。
