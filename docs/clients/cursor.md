# Cursor

OpenAI-compatible custom endpoint in Cursor Settings.

中文：[cursor.zh-CN.md](./cursor.zh-CN.md)

## Card

```text
Base URL: https://aapi.ai/v1
Key:      AAPI key (the value of AAPI_API_KEY), pasted into OpenAI API Key
Model:    a model_name from https://aapi.ai/pricing
```

Sample model id used in this repo: `deepseek-v4.1-flash`. Confirm it on the pricing page.

## Steps

1. Open **Cursor Settings → Models**.
2. Paste the AAPI key into **OpenAI API Key** and save.
3. Enable **Override OpenAI Base URL** and set `https://aapi.ai/v1`.
   Include `/v1`. Leave off `/chat/completions`; Cursor appends the path.
4. Add a custom model whose name is exactly a live `model_name`.
5. Select that model in Chat or Agent and send a short prompt.

Cursor documents bring-your-own keys for chat models. Tab completion stays on Cursor's built-in models: https://cursor.com/help/models-and-usage/api-keys

Cursor staff have described this override as applying to OpenAI-family requests while it is enabled. Turn it off to use Cursor-managed OpenAI models again. See https://forum.cursor.com/t/how-to-use-a-custom-openai-compatible-api-in-cursor-setup-limits-and-tips/171497. Menu labels move; the base URL and key above are the values that must match.

## Working check (terminal)

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

Same request as [`examples/curl.sh`](../../examples/curl.sh). A success here means the key, base URL, and model id are valid before you debug Cursor's UI.
