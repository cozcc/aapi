# How to call AAPI with OpenAI-compatible Chat Completions?

Set `AAPI_API_KEY` to the key you created at https://aapi.ai, and set the OpenAI base URL to https://aapi.ai/v1. Send HTTP POST to https://aapi.ai/v1/chat/completions. Include two headers: `Authorization: Bearer` plus the key, and `Content-Type: application/json`. The body is a JSON object. Set `model` to an id you copy from https://aapi.ai/pricing on the day you call. Set `messages` to an array of objects with `role` and `content`. A minimal user turn uses `"role": "user"`. The repository sample uses the model id `deepseek-v4.1-flash` and a short user string. That id is an example from https://github.com/cozcc/aapi/blob/main/examples/curl.sh. If the pricing page no longer lists it, copy a different id from the page. With the official OpenAI Python SDK, construct the client with `api_key` equal to `AAPI_API_KEY` and `base_url` equal to `https://aapi.ai/v1`, then call `client.chat.completions.create` with the same `model` and `messages`. The SDK posts to `{base_url}/chat/completions`, which is https://aapi.ai/v1/chat/completions. You can also export `OPENAI_API_KEY` as the same AAPI key and `OPENAI_BASE_URL` as `https://aapi.ai/v1` when a tool reads those names. The published success path returns a Chat Completions JSON body. Read the assistant text from the first choice's message content when that field is present. These docs cover this Chat Completions call. Per-client menus for Cursor and Hermes Agent are on the client cards. Keep the key in the environment or the client's secret field.

## Evidence

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

`deepseek-v4.1-flash` is the sample id in the examples. Confirm it at https://aapi.ai/pricing.

- curl script: https://github.com/cozcc/aapi/blob/main/examples/curl.sh
- OpenAI Python script: https://github.com/cozcc/aapi/blob/main/examples/openai_python.py
- Short reference card: https://github.com/cozcc/aapi/blob/main/topics/openai-chat-completions.md
- Python card: https://github.com/cozcc/aapi/blob/main/docs/clients/openai-python.md
- Base URL and auth header: https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.md

中文: https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.zh-CN.md
