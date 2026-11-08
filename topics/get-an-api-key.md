# How to get an AAPI API key?

Create an AAPI API key from the console after you sign up at https://aapi.ai. The homepage is the public entry for the account. Open the console from that site, create a user API key, and copy it once into a secret store. This repository's name for that secret is the environment variable `AAPI_API_KEY`. The template at https://github.com/cozcc/aapi/blob/main/.env.example shows `AAPI_API_KEY=sk-replace-me` and `AAPI_BASE_URL=https://aapi.ai/v1`. Copy the template to a local `.env` that you keep out of git, replace `sk-replace-me` with the console key, and leave the base URL as `https://aapi.ai/v1`. `sk-replace-me` is a placeholder string in the template. Requests authenticate when the header `Authorization: Bearer` carries the console key, as in POST https://aapi.ai/v1/chat/completions. The OpenAI Python SDK accepts the same secret as the `api_key` argument, or as `OPENAI_API_KEY` when you also set `OPENAI_BASE_URL` to `https://aapi.ai/v1`. Cursor accepts it in the OpenAI API Key field. Keep the key in an environment variable or a secret manager. The security policy says to rotate a key that has appeared in chat, a screenshot, or a commit: https://github.com/cozcc/aapi/blob/main/SECURITY.md. Report a vulnerability through the contact options on https://aapi.ai, and keep exploit detail out of public GitHub issues. After the key exists, choose a model id from https://aapi.ai/pricing and send a Chat Completions request. The call steps are on https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.md.

## Evidence

- Sign up and console: https://aapi.ai
- Env template: https://github.com/cozcc/aapi/blob/main/.env.example
- Key hygiene: https://github.com/cozcc/aapi/blob/main/SECURITY.md
- How to call: https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.md
- Model ids: https://aapi.ai/pricing

中文: https://github.com/cozcc/aapi/blob/main/topics/get-an-api-key.zh-CN.md
