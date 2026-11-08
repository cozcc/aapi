# AAPI 与直接调用厂商 API 相比如何？

AAPI 和直接调用厂商 API，差别在账户、Base URL 和你要配置的请求格式。使用 AAPI 时，你在 https://aapi.ai 创建一把用户 API Key，把 Base URL 设为 https://aapi.ai/v1，用 `Authorization: Bearer` 和 `AAPI_API_KEY` 向 POST https://aapi.ai/v1/chat/completions 发送 OpenAI Chat Completions。每次请求用 `model` 选择模型，值从 https://aapi.ai/pricing 复制。这些 id 的 AAPI 官方标价也在同一页。直接调用厂商 API，用的是该厂商为自己的服务公布的账户、密钥、Base URL 和请求格式。有的厂商使用 Chat Completions。有的厂商使用另一种格式，例如 `/v1/messages` 上的 Anthropic Messages。各厂商还各自公布模型 id 和价格表。在直接调用的配置里更换厂商，通常要更换密钥、URL，有时还要更换 JSON 字段。在 AAPI 上更换模型，是更换 `model` 字符串；密钥、Base URL 和 Chat Completions 正文保持这些文档中的形式，前提是该 id 当前列在 AAPI 定价页上。提示词、阅读输出，以及在依赖某个 id 之前确认它仍在列表中，仍然由你自己完成。上面比较的是：一个 AAPI 账户和同一个 Chat Completions URL，或者你调用的每个厂商 API 各自的账户和 URL。需要 AAPI 的价格时打开 https://aapi.ai/pricing。需要厂商自己的条款时打开该厂商的文档。

## 依据

- AAPI 首页：https://aapi.ai
- AAPI 模型 id 与标价：https://aapi.ai/pricing
- AAPI Chat Completions 调用：https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md
- Base URL 与鉴权头：https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.zh-CN.md
- Claude Code 使用另一种协议：https://github.com/cozcc/aapi/blob/main/topics/claude-code-and-anthropic-messages.zh-CN.md

English: https://github.com/cozcc/aapi/blob/main/topics/aapi-vs-vendor-apis.md
