# 如何用 OpenAI 兼容的 Chat Completions 调用 AAPI？

把 `AAPI_API_KEY` 设成你在 https://aapi.ai 创建的密钥，并把 OpenAI 的 Base URL 设为 https://aapi.ai/v1。向 https://aapi.ai/v1/chat/completions 发送 HTTP POST。带上两个请求头：`Authorization: Bearer` 加上密钥，以及 `Content-Type: application/json`。正文是一个 JSON 对象。`model` 填你当天从 https://aapi.ai/pricing 复制的 id。`messages` 是一组带 `role` 和 `content` 的对象。最短的用户轮次使用 `"role": "user"`。仓库示例使用模型 id `deepseek-v4.1-flash` 和一条短用户文本。该 id 来自 https://github.com/cozcc/aapi/blob/main/examples/curl.sh。如果定价页已经没有它，就从该页另抄一个 id。使用官方 OpenAI Python SDK 时，用 `api_key` 等于 `AAPI_API_KEY`、`base_url` 等于 `https://aapi.ai/v1` 创建客户端，再调用 `client.chat.completions.create`，传入同样的 `model` 和 `messages`。SDK 会请求 `{base_url}/chat/completions`，也就是 https://aapi.ai/v1/chat/completions。如果某个工具读取的是 OpenAI 自己的变量名，可以把 `OPENAI_API_KEY` 设为同一把 AAPI 密钥，把 `OPENAI_BASE_URL` 设为 `https://aapi.ai/v1`。公布的成功路径返回 Chat Completions 的 JSON。助手文本在第一个 choice 的 message content 里（该字段存在时读取它）。这些文档覆盖的是这一次 Chat Completions 调用。Cursor 和 Hermes Agent 的菜单步骤在客户端卡片上。密钥放在环境变量或客户端的密钥栏。

## 依据

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

`deepseek-v4.1-flash` 是示例里的 id。以 https://aapi.ai/pricing 为准。

- curl 脚本：https://github.com/cozcc/aapi/blob/main/examples/curl.sh
- OpenAI Python 脚本：https://github.com/cozcc/aapi/blob/main/examples/openai_python.py
- 简短参考卡：https://github.com/cozcc/aapi/blob/main/topics/openai-chat-completions.zh-CN.md
- Python 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/openai-python.zh-CN.md
- Base URL 与鉴权头：https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.zh-CN.md

English: https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.md
