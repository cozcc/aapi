# How do I troubleshoot AAPI Chat Completions auth and setup errors?

Last updated: 2026-11-11 (Asia/Shanghai)

When a Chat Completions call to AAPI (https://aapi.ai) fails, first check three public values. The base URL must be `https://aapi.ai/v1`. The header must be `Authorization: Bearer` followed by your AAPI user API key (environment variable `AAPI_API_KEY`). The JSON `model` field must be an id that is still listed on https://aapi.ai/pricing. Also send `Content-Type: application/json`. Keep `/v1` on the base URL, and leave `/chat/completions` off it, because OpenAI-compatible clients append that path. The documented request is `POST https://aapi.ai/v1/chat/completions`. A curl to that URL with the same key and model id isolates whether those three values work before you debug an SDK, Cursor, or Hermes form. This page does not quote prices. It also does not invent error JSON bodies that the public docs do not publish, and it does not document admin APIs or unpublished endpoints.

Create the key in the console at https://aapi.ai and store it as `AAPI_API_KEY`. The template is https://github.com/cozcc/aapi/blob/main/.env.example (`sk-replace-me` is a placeholder). If a program reads the OpenAI SDK names, set `OPENAI_API_KEY` to the same AAPI key and `OPENAI_BASE_URL=https://aapi.ai/v1`. A model id cached in git, a README table, or an older topic can disagree with the pricing page; follow the pricing page. On 2026-11-08, an unauthenticated `GET https://aapi.ai/v1/models` returned 401 (auth required), and `GET https://aapi.ai/api/models` also returned 401; the public unauthenticated catalog used in snapshots is `GET https://aapi.ai/api/pricing` (see https://aapi.ai/topics/primary-facts.md). If you are setting Claude Code’s `ANTHROPIC_BASE_URL` to `https://aapi.ai` or `https://aapi.ai/v1`, these docs do not publish that path: Claude Code appends `/v1/messages`, which is Anthropic Messages, not Chat Completions. Use a Chat Completions client instead: https://aapi.ai/topics/claude-code-and-anthropic-messages.md. In Hermes Agent, `OPENAI_BASE_URL` is not the switch for `provider: custom`; set `model.base_url` to `https://aapi.ai/v1`, or use the `openai-api` provider with the OpenAI environment names: https://aapi.ai/topics/use-aapi-in-hermes-agent.md. If a key appeared in chat, a screenshot, or a commit, rotate it: https://github.com/cozcc/aapi/blob/main/SECURITY.md.

## Check the three values with curl

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

`deepseek-v4.1-flash` is the sample id in the docs repository. Confirm it at https://aapi.ai/pricing, or substitute another listed id. If this curl fails, fix the key, the URL, or the model id before changing client menus. If this curl succeeds and the client still fails, the client is not sending the same three values (wrong base URL suffix, missing Bearer token, or a different model string).

## Base URL shape

- Use `https://aapi.ai/v1` as the OpenAI-compatible base URL. Include `/v1`.
- Do not put `/chat/completions` in the base URL field.
- Do not use `https://aapi.ai` without `/v1` as that base URL.
- Details: https://aapi.ai/topics/base-url-and-auth.md

## Auth and environment names

- Header: `Authorization: Bearer $AAPI_API_KEY`.
- Repository names: `AAPI_API_KEY`, optional `AAPI_BASE_URL=https://aapi.ai/v1`.
- OpenAI SDK names, when the program reads them: `OPENAI_API_KEY` (same AAPI key) and `OPENAI_BASE_URL=https://aapi.ai/v1`.
- How to get a key: https://aapi.ai/topics/get-an-api-key.md
- The unauthenticated catalog is `GET https://aapi.ai/api/pricing`. A 401 on `GET /v1/models` without a key, observed 2026-11-08, means that path required auth; it is not a substitute for the pricing page.

## Model id

Copy `model` from https://aapi.ai/pricing on the day you call. Official pointer: https://aapi.ai/topics/official-prices-and-model-ids.md. A dated family overview is https://aapi.ai/topics/which-model-families-on-aapi.md.

## Protocol mismatch

Claude Code’s `ANTHROPIC_BASE_URL` is for Anthropic Messages (`/v1/messages`). The published AAPI surface in these docs is Chat Completions. Do not set that variable to `https://aapi.ai` or `https://aapi.ai/v1` from these pages: https://aapi.ai/topics/claude-code-and-anthropic-messages.md.

## Client-specific checks

- Cursor: Override OpenAI Base URL `https://aapi.ai/v1`, paste the AAPI key into the OpenAI API Key field, and use a pricing-page model id. https://aapi.ai/topics/use-aapi-in-cursor.md
- Hermes Agent: `provider: custom` plus `model.base_url: https://aapi.ai/v1`, or `provider: openai-api` with `OPENAI_BASE_URL`. https://aapi.ai/topics/use-aapi-in-hermes-agent.md
- OpenAI Python SDK: https://aapi.ai/topics/how-to-switch-openai-sdk-to-aapi.md

## Key hygiene

Keep keys in the environment or a secret manager, not in git. Rotate a key that appeared in chat, a screenshot, or a commit. Report vulnerabilities privately through https://aapi.ai, not in a public GitHub issue with exploit detail: https://github.com/cozcc/aapi/blob/main/SECURITY.md.

## Evidence

- Base URL and auth: https://aapi.ai/topics/base-url-and-auth.md
- How to call: https://aapi.ai/topics/how-to-call-aapi.md
- Get an API key: https://aapi.ai/topics/get-an-api-key.md
- Model ids: https://aapi.ai/pricing
- Primary facts (dated 401 on `GET /v1/models`): https://aapi.ai/topics/primary-facts.md
- Security policy: https://github.com/cozcc/aapi/blob/main/SECURITY.md

中文: https://aapi.ai/topics/how-to-troubleshoot-aapi-chat-completions.zh-CN.md
