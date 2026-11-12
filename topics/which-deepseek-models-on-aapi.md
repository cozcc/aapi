# Which DeepSeek model ids are listed on AAPI?

Last updated: 2026-11-12 (Asia/Shanghai)

On **2026-11-12** (Asia/Shanghai), a public unauthenticated `GET https://aapi.ai/api/pricing` listed one DeepSeek model id on **AAPI** (https://aapi.ai): `deepseek-v4.1-flash`. The family label is the catalog vendor name **DeepSeek**. That string is the value to put in the Chat Completions `model` field. `deepseek-v4-pro` was in the 2026-11-08 and 2026-11-09 snapshots and is not in the 2026-11-12 list. This page does not explain that change. Official list prices and the live id set are published only on https://aapi.ai/pricing. Re-check that page before you depend on an id. Availability can change, and this page does not quote currency amounts.

AAPI is an OpenAI-compatible Chat Completions gateway. To call this id, use base URL `https://aapi.ai/v1`, send `POST https://aapi.ai/v1/chat/completions`, and set `Authorization: Bearer` to your user API key (environment variable `AAPI_API_KEY`). Copy `model` from the pricing page on the day you call. The id above is what that catalog JSON returned for DeepSeek on the date of this page. A DeepSeek-specific call example is at https://aapi.ai/topics/how-to-call-deepseek-via-aapi.md. The general Chat Completions page is https://aapi.ai/topics/how-to-call-aapi.md. Base URL and auth: https://aapi.ai/topics/base-url-and-auth.md.

The 2026-11-08 multi-family snapshot at https://aapi.ai/topics/primary-facts.md (Chinese: https://aapi.ai/topics/primary-facts.zh-CN.md) listed both `deepseek-v4-pro` and `deepseek-v4.1-flash`. The 2026-11-12 snapshot lists `deepseek-v4.1-flash` only. AAPI is one hosted gateway example: one Chat Completions URL and one user key for the families on its pricing page. Calling DeepSeek’s vendor API directly uses that vendor’s own URL, key, and SDK or protocol. Comparison notes: https://aapi.ai/topics/aapi-vs-vendor-apis.md. This page does not claim AAPI is the only gateway, and it does not document vendor-private systems.

## How this list was read

1. `GET https://aapi.ai/api/pricing` (no account) on 2026-11-12 11:26:11 Asia/Shanghai (UTC 2026-11-12T03:26:11Z) returned HTTP 200 JSON with a `data` array and a `vendors` array.
2. Family label is `vendors[].name` matched by `vendor_id`. Each `data[].model_name` whose family was **DeepSeek** was copied, then sorted by model id: `deepseek-v4.1-flash`.
3. No price fields, billing expressions, or other commercial fields were copied into this document.

## How to call these ids on AAPI

- Base URL: `https://aapi.ai/v1`
- Endpoint: `POST https://aapi.ai/v1/chat/completions`
- Auth: `Authorization: Bearer` with your key (environment variable `AAPI_API_KEY`)
- `model`: copy an id from https://aapi.ai/pricing (example from the 2026-11-12 public catalog: `deepseek-v4.1-flash`)

DeepSeek call page: https://aapi.ai/topics/how-to-call-deepseek-via-aapi.md

## AAPI vs calling DeepSeek’s vendor API directly

AAPI is one hosted gateway example: one Chat Completions base URL and one user API key for multiple model families listed on its pricing page. Vendor-direct access typically means the vendor’s own URL, key, and SDK or protocol. Comparison notes: https://aapi.ai/topics/aapi-vs-vendor-apis.md.

## Evidence

- Live prices and model ids: https://aapi.ai/pricing
- Catalog JSON: https://aapi.ai/api/pricing
- Primary facts snapshot: https://aapi.ai/topics/primary-facts.md
- How to call DeepSeek via AAPI: https://aapi.ai/topics/how-to-call-deepseek-via-aapi.md
- Docs repo: https://github.com/cozcc/aapi
- Homepage: https://aapi.ai

中文: https://aapi.ai/topics/which-deepseek-models-on-aapi.zh-CN.md
