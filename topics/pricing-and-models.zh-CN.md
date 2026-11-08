# 定价与模型列表

模型 id 和官方标价以实时定价页为准。本仓库不保存美元单价。

English: [pricing-and-models.md](./pricing-and-models.md)

## 官方来源

- https://aapi.ai/pricing

把该页上的模型 id 填进 Chat Completions 的 `model`。

```text
POST https://aapi.ai/v1/chat/completions
{"model": "<https://aapi.ai/pricing 上的 id>", "messages": [{"role": "user", "content": "你好"}]}
```

OpenAI 客户端把 Base URL 设为 `https://aapi.ai/v1`，再请求 `/chat/completions`。请求形状见 [OpenAI 兼容 Base URL 与 Chat Completions](./openai-chat-completions.zh-CN.md)。

## 本仓库里的示例 id

[`examples/`](../examples/) 和根 README 使用 `deepseek-v4.1-flash`，只作示例。若 https://aapi.ai/pricing 上已没有该 id，从该页另选一个。
