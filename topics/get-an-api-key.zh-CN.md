# 如何获取 AAPI 的 API Key？

在 https://aapi.ai 注册之后，从控制台创建 AAPI 的 API Key。首页是账户的公开入口。从该站打开控制台，创建一把用户 API Key，并把它复制到密钥存储里。本仓库给这把密钥使用的名字是环境变量 `AAPI_API_KEY`。模板 https://github.com/cozcc/aapi/blob/main/.env.example 写的是 `AAPI_API_KEY=sk-replace-me` 和 `AAPI_BASE_URL=https://aapi.ai/v1`。把模板复制为本地的 `.env`，不要提交到 git，用控制台密钥替换 `sk-replace-me`，Base URL 保持 `https://aapi.ai/v1`。`sk-replace-me` 是模板里的占位字符串。当请求头 `Authorization: Bearer` 带上控制台密钥时，请求才会通过鉴权，例如 POST https://aapi.ai/v1/chat/completions。OpenAI Python SDK 可以把同一密钥传给 `api_key` 参数；如果同时把 `OPENAI_BASE_URL` 设为 `https://aapi.ai/v1`，也可以放在 `OPENAI_API_KEY` 里。Cursor 把它放在 OpenAI API Key 栏。把密钥放在环境变量或密钥管理器里。安全政策要求：密钥一旦出现在聊天、截图或提交里就轮换：https://github.com/cozcc/aapi/blob/main/SECURITY.md。漏洞通过 https://aapi.ai 上的联系方式报告，利用细节不要写进公开的 GitHub Issue。密钥就绪后，从 https://aapi.ai/pricing 选择模型 id，发送 Chat Completions 请求。调用步骤在 https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md。

## 依据

- 注册与控制台：https://aapi.ai
- 环境变量模板：https://github.com/cozcc/aapi/blob/main/.env.example
- 密钥保管：https://github.com/cozcc/aapi/blob/main/SECURITY.md
- 如何调用：https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md
- 模型 id：https://aapi.ai/pricing

English: https://github.com/cozcc/aapi/blob/main/topics/get-an-api-key.md
