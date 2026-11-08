# 定价与模型列表

价格和模型目录在请求时从官方页面读取。本仓库不保存美元单价。

English: [pricing-and-models.md](./pricing-and-models.md)

## 官方来源

- 给人看的页面：https://aapi.ai/pricing
- JSON，无需账号：`GET https://aapi.ai/api/pricing`

```bash
curl -sS https://aapi.ai/api/pricing
```

## `model` 填什么

JSON 数组 `data` 里每个对象有字符串 `model_name`。该字符串就是 Chat Completions 的 `model`。

```text
POST https://aapi.ai/v1/chat/completions
{"model": "<data[].model_name>", "messages": [{"role": "user", "content": "你好"}]}
```

客户端配置只需要 `model_name`。响应里的计费表达式、厂商 id、分组 id 不是请求字段。

同一份响应里的 `supported_endpoint.openai` 给出 Chat Completions 的路径和方法。路径挂在主机上：`POST https://aapi.ai/v1/chat/completions`。OpenAI 客户端把 Base URL 设为 `https://aapi.ai/v1`，再拼接 `/chat/completions`。若线上对象有变，以线上对象为准。

## 本仓库里的示例 id

[`examples/`](../examples/) 和根 README 使用 `deepseek-v4.1-flash`，只作示例。若 https://aapi.ai/pricing 上已没有该 id，从响应里另选一个 `model_name`。

调用方式见 [OpenAI 兼容 Base URL 与 Chat Completions](./openai-chat-completions.zh-CN.md)。
