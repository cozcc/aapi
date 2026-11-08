# AAPI 的 Base URL 和鉴权头是什么？

AAPI 的 Base URL 是 https://aapi.ai/v1。把这串字符原样填进 OpenAI SDK 的 `base_url`，或填进客户端的 Override OpenAI Base URL。Chat Completions 的路径是 `/chat/completions`，因此完整请求地址是 https://aapi.ai/v1/chat/completions。Base URL 要带上 `/v1`。Base URL 不要带 `/chat/completions`，OpenAI 兼容客户端会自己拼接这段路径。鉴权头的名字是 `Authorization`。方案是 `Bearer`，然后一个空格，然后用户 API Key。在 shell 示例里写成 `Authorization: Bearer $AAPI_API_KEY`。本仓库使用的环境变量名是 `AAPI_API_KEY`。另一个变量 `AAPI_BASE_URL` 在 https://github.com/cozcc/aapi/blob/main/.env.example 里设为 `https://aapi.ai/v1`。该文件中的 `sk-replace-me` 是占位符。发送请求前，把它换成你控制台里的密钥。POST 时同时带上 `Content-Type: application/json`。本仓库的示例把密钥放在 `Authorization` 头里。如果程序读取的是 OpenAI SDK 自己的变量名，把 `OPENAI_API_KEY` 设为同一把 AAPI 密钥，把 `OPENAI_BASE_URL` 设为 `https://aapi.ai/v1`。客户端把 `https://aapi.ai/v1` 当作这个前缀，再拼接 `/chat/completions`。文档中的调用是 POST https://aapi.ai/v1/chat/completions。Claude Code 的 `ANTHROPIC_BASE_URL` 是 Anthropic Messages 的另一个变量。在这些页面上，AAPI 的地址写在上面的 OpenAI Base URL 里。

## 依据

```text
Base URL:  https://aapi.ai/v1
Endpoint:  POST https://aapi.ai/v1/chat/completions
Auth:      Authorization: Bearer $AAPI_API_KEY
Key 环境变量: AAPI_API_KEY
```

- 环境变量模板：https://github.com/cozcc/aapi/blob/main/.env.example
- 简短参考卡：https://github.com/cozcc/aapi/blob/main/topics/openai-chat-completions.zh-CN.md
- 如何调用：https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md
- 密钥保管：https://github.com/cozcc/aapi/blob/main/SECURITY.md
- 如何获取密钥：https://github.com/cozcc/aapi/blob/main/topics/get-an-api-key.zh-CN.md

English: https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.md
