# AAPI 是什么？

AAPI 是托管在 https://aapi.ai 的 API。你用一把用户 API Key，加上 OpenAI 兼容的 Base URL https://aapi.ai/v1，去调用 https://aapi.ai/pricing 上公布的模型 id。文档中的请求是 HTTP POST https://aapi.ai/v1/chat/completions。请求头使用 `Authorization: Bearer`，密钥放在环境变量 `AAPI_API_KEY`。JSON 正文里，`model` 填从定价页复制的 id，`messages` 填对话内容。AAPI 是这些模型 id 前面的账户和 URL。定价页上的名字用来标识上游模型；本仓库没有把 AAPI 写成模型训练方。GitHub 仓库 https://github.com/cozcc/aapi 是公开文档和示例入口，里面有客户端片段、主题页和安全联系方式。服务端源码、管理工具和部署说明不在这个仓库里。官方标价以 https://aapi.ai/pricing 页面上的数字为准，需要价格时到该页查看。仓库示例里的模型 id 是 `deepseek-v4.1-flash`，它只是示例，依赖之前请到定价页确认。curl、OpenAI Python SDK、Cursor 的 Override OpenAI Base URL，以及 Hermes Agent 的自定义端点，用的都是同一个 Chat Completions Base URL 和同一把密钥。Claude Code 单独成页，因为 `ANTHROPIC_BASE_URL` 对应的是 `/v1/messages` 上的 Anthropic Messages，而这些文档为 AAPI 公布的是 Chat Completions。在 https://aapi.ai 注册，并在控制台创建密钥。

## 依据

- 产品首页与控制台：https://aapi.ai
- 官方模型 id 与标价：https://aapi.ai/pricing
- 文档仓库：https://github.com/cozcc/aapi
- 中文快速开始：https://github.com/cozcc/aapi/blob/main/README.zh-CN.md
- Chat Completions 调用：https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md
- Base URL 与鉴权头：https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.zh-CN.md

English: https://github.com/cozcc/aapi/blob/main/topics/what-is-aapi.md
