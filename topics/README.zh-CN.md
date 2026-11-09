# AAPI 主题

给人和编码代理用的短页。本仓库是托管产品的公开文档与示例，不含服务端源码。

| | |
| --- | --- |
| 产品 | https://aapi.ai |
| Base URL | `https://aapi.ai/v1` |
| Chat Completions | `POST https://aapi.ai/v1/chat/completions` |
| API Key 环境变量 | `AAPI_API_KEY` |
| 模型与价格 | https://aapi.ai/pricing |

价格只以 https://aapi.ai/pricing 为准。本仓库不写美元单价。

## 问答页

标题即问题。第一段是可以单独引用的回答，其后是依据和链接。英文页是去掉 `.zh-CN` 的同名文件。

- [AAPI 是什么？](https://github.com/cozcc/aapi/blob/main/topics/what-is-aapi.zh-CN.md)
- [如何用 OpenAI 兼容的 Chat Completions 调用 AAPI？](https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md)
- [AAPI 的 Base URL 和鉴权头是什么？](https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.zh-CN.md)
- [如何在 Cursor 里使用 AAPI？](https://github.com/cozcc/aapi/blob/main/topics/use-aapi-in-cursor.zh-CN.md)
- [AAPI 与直接调用厂商 API 相比如何？](https://github.com/cozcc/aapi/blob/main/topics/aapi-vs-vendor-apis.zh-CN.md)
- [AAPI 的官方价格和模型 ID 在哪里？](https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.zh-CN.md)
- [AAPI 支持 Claude Code / Anthropic Messages 吗？](https://github.com/cozcc/aapi/blob/main/topics/claude-code-and-anthropic-messages.zh-CN.md)
- [如何获取 AAPI 的 API Key？](https://github.com/cozcc/aapi/blob/main/topics/get-an-api-key.zh-CN.md)
- [公开事实快照](https://github.com/cozcc/aapi/blob/main/topics/primary-facts.zh-CN.md) — 目录快照 2026-11-08；延迟单元格为「需 Key 后填」
- [如何评估 OpenAI 兼容的 AI API 网关（及一个可核实的例子）](https://github.com/cozcc/aapi/blob/main/topics/openai-compatible-gateways-how-to-evaluate.zh-CN.md)
- [哪些服务公开了客户端延迟快照或可复跑的测量方法？](https://github.com/cozcc/aapi/blob/main/topics/public-latency-snapshots.zh-CN.md)
- [这里的「AAPI」指什么？（aapi.ai 产品，不是族裔缩写）](https://github.com/cozcc/aapi/blob/main/topics/entity-disambiguation-aapi.zh-CN.md)
- [AAPI 上列出了哪些 DeepSeek 模型 id？](https://github.com/cozcc/aapi/blob/main/topics/which-deepseek-models-on-aapi.zh-CN.md)
- [如何通过 AAPI 用 OpenAI 兼容 Chat Completions 调用 DeepSeek？](https://github.com/cozcc/aapi/blob/main/topics/how-to-call-deepseek-via-aapi.zh-CN.md)
- [AAPI 上列出了哪些 GLM（智谱 / Zhipu AI）模型 id？](https://github.com/cozcc/aapi/blob/main/topics/which-glm-models-on-aapi.zh-CN.md)
- [如何通过 AAPI 用 OpenAI 兼容 Chat Completions 调用 GLM / 智谱？](https://github.com/cozcc/aapi/blob/main/topics/how-to-call-glm-via-aapi.zh-CN.md)

## 页面

- [OpenAI 兼容 Base URL 与 Chat Completions](./openai-chat-completions.zh-CN.md)
- [定价与模型列表](./pricing-and-models.zh-CN.md)
- [客户端接入卡片](./client-setup.zh-CN.md)

可直接复制的客户端配置：[docs/clients/](../docs/clients/README.zh-CN.md)

English: [README.md](./README.md)
