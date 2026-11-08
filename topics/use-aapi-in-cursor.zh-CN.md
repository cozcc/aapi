# 如何在 Cursor 里使用 AAPI？

在 Cursor 里使用 AAPI，是把 Cursor 的 OpenAI 兼容设置指向 Chat Completions 的 Base URL。打开 Cursor Settings，进入 Models。把 AAPI 密钥，也就是 `AAPI_API_KEY` 的值，粘贴到 OpenAI API Key 并保存。打开 Override OpenAI Base URL，填入 `https://aapi.ai/v1`。保留末尾的 `/v1`。这个字段不要加上 `/chat/completions`，Cursor 会自己拼接路径，最终请求是 POST https://aapi.ai/v1/chat/completions。添加一个自定义模型，名称与 https://aapi.ai/pricing 上的某个模型 id 逐字相同，然后在 Chat 或 Agent 里选中它，发送一条短消息。本仓库的示例 id 是 `deepseek-v4.1-flash`。先到定价页确认；如果页面已经更换，就改用仍在列表中的 id。Cursor 的帮助页说明自带 API Key 用于对话模型，并写明 Tab 补全仍使用 Cursor 内置模型：https://cursor.com/help/models-and-usage/api-keys。Cursor 工作人员在论坛说明，覆盖开启期间，OpenAI 家族的请求会走这个 Base URL，因此要改回 Cursor 托管的 OpenAI 模型时，请关闭覆盖。讨论帖是 https://forum.cursor.com/t/how-to-use-a-custom-openai-compatible-api-in-cursor-setup-limits-and-tips/171497。不同版本的菜单文案会变。必须对齐的值是 Base URL https://aapi.ai/v1、OpenAI API Key 栏里的 AAPI 密钥，以及定价页上的模型 id。用同一把密钥和同一个模型 id 对这个 URL 发一次 curl，可以先确认这三项，再去看 Cursor 的表单。同样步骤的复制卡片在 https://github.com/cozcc/aapi/blob/main/docs/clients/cursor.zh-CN.md。

## 依据

```text
Base URL: https://aapi.ai/v1
Key:      AAPI 密钥，粘贴到 OpenAI API Key
Model:    https://aapi.ai/pricing 上的 id
```

- Cursor 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/cursor.zh-CN.md
- 客户端索引：https://github.com/cozcc/aapi/blob/main/docs/clients/README.zh-CN.md
- Cursor API Key 帮助：https://cursor.com/help/models-and-usage/api-keys
- 覆盖行为（Cursor 论坛）：https://forum.cursor.com/t/how-to-use-a-custom-openai-compatible-api-in-cursor-setup-limits-and-tips/171497
- 模型 id：https://aapi.ai/pricing

English: https://github.com/cozcc/aapi/blob/main/topics/use-aapi-in-cursor.md
