# What is AAPI Base URL and auth header?

The AAPI base URL is https://aapi.ai/v1. Put that exact string in an OpenAI SDK `base_url` or in a client's Override OpenAI Base URL field. The Chat Completions path is `/chat/completions`, so the full request URL is https://aapi.ai/v1/chat/completions. Include the `/v1` segment in the base URL. Leave `/chat/completions` off the base URL, because OpenAI-compatible clients append that path themselves. The auth header name is `Authorization`. The scheme is `Bearer`, then one space, then the user API key. In shell examples this is `Authorization: Bearer $AAPI_API_KEY`. The environment variable name used by this repository is `AAPI_API_KEY`. A second variable, `AAPI_BASE_URL`, is set to `https://aapi.ai/v1` in https://github.com/cozcc/aapi/blob/main/.env.example. `sk-replace-me` in that file is a placeholder. Replace it with the key from your console before you send a request. Also send `Content-Type: application/json` on the POST. Examples in this repository send the key in the `Authorization` header. When a program reads the OpenAI SDK's own names, set `OPENAI_API_KEY` to the same AAPI key and `OPENAI_BASE_URL` to `https://aapi.ai/v1`. Clients use `https://aapi.ai/v1` as that prefix and append `/chat/completions`. The documented call is POST https://aapi.ai/v1/chat/completions. Claude Code's `ANTHROPIC_BASE_URL` is a different variable for Anthropic Messages. On these pages the AAPI value goes in the OpenAI base URL above.

## Evidence

```text
Base URL:  https://aapi.ai/v1
Endpoint:  POST https://aapi.ai/v1/chat/completions
Auth:      Authorization: Bearer $AAPI_API_KEY
Key env:   AAPI_API_KEY
```

- Env template: https://github.com/cozcc/aapi/blob/main/.env.example
- Short reference card: https://github.com/cozcc/aapi/blob/main/topics/openai-chat-completions.md
- How to call: https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.md
- Key hygiene: https://github.com/cozcc/aapi/blob/main/SECURITY.md
- How to get a key: https://github.com/cozcc/aapi/blob/main/topics/get-an-api-key.md

中文: https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.zh-CN.md
