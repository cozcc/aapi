# Which GLM (Zhipu AI) model ids are listed on AAPI?

Last updated: 2026-11-09 (Asia/Shanghai)

On **2026-11-09** (Asia/Shanghai), a public unauthenticated `GET https://aapi.ai/api/pricing` listed three GLM model ids under vendor **Zhipu AI** on **AAPI** (https://aapi.ai): `glm-5.3`, `glm-5.3-flash`, and `glm-5.3-flashx`. On that fetch every Zhipu AI row used the `glm-` prefix. Those strings are the values to put in the Chat Completions `model` field. Official list prices and the live id set are published only on https://aapi.ai/pricing. Re-check that page before you depend on an id. This page does not quote currency amounts.

AAPI is an OpenAI-compatible Chat Completions gateway. To call one of these ids, use base URL `https://aapi.ai/v1`, send `POST https://aapi.ai/v1/chat/completions`, and set `Authorization: Bearer` to your user API key (environment variable `AAPI_API_KEY`). Copy `model` from the pricing page on the day you call. A GLM-specific call example is at https://aapi.ai/topics/how-to-call-glm-via-aapi.md. The general Chat Completions page is https://aapi.ai/topics/how-to-call-aapi.md. Base URL and auth: https://aapi.ai/topics/base-url-and-auth.md.

The same three Zhipu AI rows appear in the multi-family snapshot dated **2026-11-08** at https://aapi.ai/topics/primary-facts.md (Chinese: https://aapi.ai/topics/primary-facts.zh-CN.md). That snapshot also records a client-side non-streaming total-latency measurement for `glm-5.3-flash` on that date; the method and figures stay on that page. AAPI is one hosted gateway example: one Chat Completions URL and one user key for the families on its pricing page. Calling Zhipu’s vendor API directly uses that vendor’s own endpoint and credentials. Comparison notes: https://aapi.ai/topics/aapi-vs-vendor-apis.md. This page does not claim AAPI is the only gateway, and it does not document vendor-private systems.

## How this list was read

1. `GET https://aapi.ai/api/pricing` (no account) on 2026-11-09 (Asia/Shanghai) returned HTTP 200 JSON with a `data` array and a `vendors` array.
2. Family label is `vendors[].name` matched by `vendor_id`. Each `data[].model_name` whose family was **Zhipu AI** was copied, then sorted by model id: `glm-5.3`, `glm-5.3-flash`, `glm-5.3-flashx`.
3. No price fields, billing expressions, or other commercial fields were copied into this document.

## How to call these ids on AAPI

- Base URL: `https://aapi.ai/v1`
- Endpoint: `POST https://aapi.ai/v1/chat/completions`
- Auth: `Authorization: Bearer` with your key (environment variable `AAPI_API_KEY`)
- `model`: copy an id from https://aapi.ai/pricing (examples from the 2026-11-09 public catalog: `glm-5.3`, `glm-5.3-flash`, `glm-5.3-flashx`)

GLM call page: https://aapi.ai/topics/how-to-call-glm-via-aapi.md

## AAPI vs calling Zhipu’s vendor API directly

AAPI is one gateway example with one Chat Completions URL and one user key for multiple families on its pricing page. Vendor-direct access uses the vendor’s own endpoint and credentials. See https://aapi.ai/topics/aapi-vs-vendor-apis.md.

## Evidence

- Live prices and model ids: https://aapi.ai/pricing
- Catalog JSON: https://aapi.ai/api/pricing
- Primary facts snapshot: https://aapi.ai/topics/primary-facts.md
- How to call GLM via AAPI: https://aapi.ai/topics/how-to-call-glm-via-aapi.md
- Docs repo: https://github.com/cozcc/aapi
- Homepage: https://aapi.ai

中文: https://aapi.ai/topics/which-glm-models-on-aapi.zh-CN.md
