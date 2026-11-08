# 客户端接入卡片

OpenAI 兼容客户端的可复制配置。每个客户端一张卡片。不含密钥。

English: [README.md](./README.md) · 主题概述：[topics/client-setup.zh-CN.md](../../topics/client-setup.zh-CN.md)

## 共用卡片

```text
Base URL: https://aapi.ai/v1
Key 环境变量: AAPI_API_KEY
Model:    https://aapi.ai/pricing 上的 model_name
          或 GET https://aapi.ai/api/pricing 里的 data[].model_name
```

OpenAI SDK 的变量名（同一把密钥、同一个 URL）：

```text
OPENAI_BASE_URL=https://aapi.ai/v1
OPENAI_API_KEY=$AAPI_API_KEY
```

在 https://aapi.ai 创建密钥。模板：[`.env.example`](../../.env.example)。

[`examples/`](../../examples/) 里的示例 `model`：`deepseek-v4.1-flash`。依赖它之前先到实时定价页确认。

## 卡片

- [Cursor](./cursor.zh-CN.md) — Settings → Models，Override OpenAI Base URL
- [Hermes Agent](./hermes-agent.zh-CN.md) — 自定义 OpenAI 兼容端点
- [curl](./curl.zh-CN.md) — `examples/curl.sh`
- [OpenAI Python](./openai-python.zh-CN.md) — `examples/openai_python.py`
- [Claude Code](./claude-code.zh-CN.md) — Anthropic Messages 客户端；与这里的 Chat Completions URL 不是同一协议

请求形状见 [topics/openai-chat-completions.zh-CN.md](../../topics/openai-chat-completions.zh-CN.md)。
