# Cursor

在 Cursor Settings 里使用 OpenAI 兼容的自定义端点。

English: [cursor.md](./cursor.md)

## 卡片

```text
Base URL: https://aapi.ai/v1
Key:      AAPI 密钥（即 AAPI_API_KEY 的值），粘贴到 OpenAI API Key
Model:    https://aapi.ai/pricing 上的 model_name
```

本仓库示例模型 id：`deepseek-v4.1-flash`。以定价页为准。

## 步骤

1. 打开 **Cursor Settings → Models**。
2. 把 AAPI 密钥粘贴到 **OpenAI API Key** 并保存。
3. 打开 **Override OpenAI Base URL**，填 `https://aapi.ai/v1`。
   保留 `/v1`。不要加上 `/chat/completions`，路径由 Cursor 自己拼接。
4. 添加自定义模型，名称与实时 `model_name` 完全一致。
5. 在 Chat 或 Agent 里选中该模型，发一条短消息。

Cursor 文档说明自带密钥用于对话模型。Tab 补全仍走 Cursor 内置模型：https://cursor.com/help/models-and-usage/api-keys

Cursor 工作人员在论坛说明：覆盖开启时，OpenAI 家族的请求会走该端点。要改回 Cursor 托管的 OpenAI，请关闭覆盖。见 https://forum.cursor.com/t/how-to-use-a-custom-openai-compatible-api-in-cursor-setup-limits-and-tips/171497。菜单文案会变；以上 Base URL 和密钥才是必须对齐的值。

## 终端自检

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

与 [`examples/curl.sh`](../../examples/curl.sh) 相同。这条成功说明密钥、Base URL 和模型 id 有效，再去看 Cursor 界面。
