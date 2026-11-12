# Which model families are listed on AAPI?

Last updated: 2026-11-12 (Asia/Shanghai)

AAPI (https://aapi.ai) publishes official model ids and official list prices only on https://aapi.ai/pricing. The family labels and ids on this page come from a public unauthenticated `GET https://aapi.ai/api/pricing` on 2026-11-12 (Asia/Shanghai), using the same copy method as https://aapi.ai/topics/primary-facts.md: copy each `data[].model_name`, and when `vendor_id` matches `vendors[].id`, use `vendors[].name` as the family; if there is no `vendor_id` or no match, write `unknown`. This page does not copy USD amounts, billing expressions, group identifiers, or quota fields, and it does not invent model ids that were missing from that day’s JSON. Re-check the pricing page before you depend on an id. The catalog changes, and a git or snapshot list can lag the live page. To call a listed id, use base URL `https://aapi.ai/v1` and `POST https://aapi.ai/v1/chat/completions` with `Authorization: Bearer` and `AAPI_API_KEY`.

On that 2026-11-12 fetch the JSON was HTTP 200 with a `data` array of 14 model ids and a `vendors` array. Families that had at least one `data` row were Alibaba, Anthropic, DeepSeek, Moonshot, OpenAI, and Zhipu AI, plus one id with no `vendor_id` recorded as `unknown`. The same `vendors` array also included xAI and 字节跳动, which had no `data` rows on this fetch. To call any listed id, use base URL `https://aapi.ai/v1`, send `POST https://aapi.ai/v1/chat/completions`, and set `Authorization: Bearer` with your user API key (environment variable `AAPI_API_KEY`). Dedicated DeepSeek and GLM pages already exist. The 2026-11-08 snapshot listed two ids that are not in this 2026-11-12 JSON: `deepseek-v4-pro` and `grok-4.7`. Those two strings were also absent from the 2026-11-11 JSON. This page does not explain that change. Use https://aapi.ai/pricing as the live list. AAPI is one hosted Chat Completions gateway example, not the only gateway. Comparison with calling a vendor API directly: https://aapi.ai/topics/aapi-vs-vendor-apis.md.

## Public catalog on 2026-11-12 (names only)

Source: `GET https://aapi.ai/api/pricing` (no account) at 2026-11-12 11:26:11 Asia/Shanghai (UTC 2026-11-12T03:26:11Z). Family = `vendors[].name` matched by `vendor_id`. Sorted by family, then model id. No prices.

| Family | Model id |
| --- | --- |
| Alibaba | `qwen3.8-max` |
| Anthropic | `claude-fable-5-1` |
| Anthropic | `claude-haiku-5-5` |
| Anthropic | `claude-opus-4-8` |
| Anthropic | `claude-opus-5-5` |
| DeepSeek | `deepseek-v4.1-flash` |
| Moonshot | `kimi-k3` |
| OpenAI | `gpt-6-astra` |
| OpenAI | `gpt-6-sol` |
| OpenAI | `gpt-6.1-sol` |
| Zhipu AI | `glm-5.3` |
| Zhipu AI | `glm-5.3-flash` |
| Zhipu AI | `glm-5.3-flashx` |
| unknown | `kimi-k3.1-pro` |

Vendors present in the same JSON payload (id → name): 35 DeepSeek, 36 Zhipu AI, 38 OpenAI, 39 Anthropic, 40 xAI, 41 字节跳动, 42 Alibaba, 43 Moonshot. Vendor 40 (xAI) and vendor 41 (字节跳动) had no `data` rows on this fetch. Model `kimi-k3.1-pro` had no `vendor_id` → family `unknown` per the snapshot method.

The 2026-11-08 snapshot additionally listed `deepseek-v4-pro` (DeepSeek) and `grok-4.7` (xAI). Those two strings were absent from the 2026-11-11 JSON and are absent from the 2026-11-12 JSON. If a README, example, or older topic still shows them, follow https://aapi.ai/pricing.

## How to call a listed id

- Base URL: `https://aapi.ai/v1`
- Endpoint: `POST https://aapi.ai/v1/chat/completions`
- Auth: `Authorization: Bearer` with `AAPI_API_KEY`
- `model`: copy an id from https://aapi.ai/pricing (this page’s dated examples include `deepseek-v4.1-flash`)

General call page: https://aapi.ai/topics/how-to-call-aapi.md. DeepSeek: https://aapi.ai/topics/which-deepseek-models-on-aapi.md. GLM / Zhipu AI: https://aapi.ai/topics/which-glm-models-on-aapi.md. Official prices: https://aapi.ai/topics/official-prices-and-model-ids.md.

## How this list was read

1. `GET https://aapi.ai/api/pricing` (no account) on 2026-11-12 11:26:11 Asia/Shanghai (UTC 2026-11-12T03:26:11Z) returned HTTP 200 JSON with a `data` array and a `vendors` array.
2. Family label is `vendors[].name` matched by `vendor_id`. Each `data[].model_name` was copied and sorted by family, then by model id.
3. No price fields, billing expressions, group identifiers, or quota fields were copied into this document.

## Evidence

- Live prices and model ids: https://aapi.ai/pricing
- Catalog JSON: https://aapi.ai/api/pricing
- Snapshot method and 2026-11-12 table: https://aapi.ai/topics/primary-facts.md
- Official prices pointer: https://aapi.ai/topics/official-prices-and-model-ids.md
- Docs repo: https://github.com/cozcc/aapi
- Homepage: https://aapi.ai

中文: https://aapi.ai/topics/which-model-families-on-aapi.zh-CN.md
