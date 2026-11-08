# AAPI primary facts snapshot

Last updated: 2026-11-08 (Asia/Shanghai)

This page is a recurring public snapshot. It lists public model ids and family names from the catalog JSON, links to official prices, and records client-side latency only after a real measurement. USD amounts stay on https://aapi.ai/pricing and are omitted from this file.

**Catalog fetch (this snapshot):** `GET https://aapi.ai/api/pricing` → HTTP 200 `application/json` at 2026-11-08 18:14:21 Asia/Shanghai (UTC 2026-11-08T10:14:21Z). Success payload with `data` + `vendors`.

**Latency (this snapshot):** not measured — `AAPI_API_KEY` was unset in the measurement environment. Cells below say **needs API key** until a run that follows the measurement method fills them. Do not invent numbers.

## What a snapshot may contain

- The UTC date of the run
- Model ids and family labels read from the public catalog JSON when that JSON is available
- The official price page: https://aapi.ai/pricing
- Latency cells filled from the measurement method below, after a run exists

## How to list public model families

1. Request `GET https://aapi.ai/api/pricing` with no account.
2. If the body is not JSON, or it has no `data` array, write `catalog JSON unavailable` and stop. Keep the link to https://aapi.ai/pricing.
3. For each object in `data`, copy `model_name` and nothing else from that object.
4. If the payload includes a `vendors` array, match `vendor_id` to `vendors[].id` and copy `vendors[].name` as the family label. If there is no match, write the family as `unknown`.
5. Sort by family label, then by model id.
6. Leave every other field out of git. That includes billing expressions, group identifiers, quota fields, and every numeric price.
7. Point readers to https://aapi.ai/pricing for official list prices.

### Manual check if catalog JSON is unavailable

Open https://aapi.ai/pricing in a browser. Copy each visible model id string exactly. Do not copy USD (or other currency) amounts into git. Family labels may be taken from the vendor grouping shown on that page when the JSON `vendors` array is missing. Cross-check ids against docs topics that point at the pricing page only.

## How to measure latency

Publish a latency figure only when a run that follows this protocol produced it. Until then use `needs API key` / `numbers filled when measured`.

- Call `POST https://aapi.ai/v1/chat/completions` with `Authorization: Bearer` and the key in `AAPI_API_KEY`. The published note omits the key.
- Send non-streaming JSON: `temperature` 0, one user message whose content is `ping`, and a `model` id copied from https://aapi.ai/pricing on the same UTC date.
- Total latency is the client wall-clock time from the start of the request until the response body is complete, in milliseconds.
- Streaming time-to-first-byte is a separate metric. This method records non-streaming total latency.
- Discard 1 warmup call. Then send 20 sequential calls.
- Record the sample count, the median, the 95th percentile, the HTTP error count, the client region in plain language, and the UTC date.
- Count failed attempts in the attempt total, and publish the error count beside the latency.
- State the client and the region in the notes. One sample is a single observation, and the published row uses the 20-call set above.

## Public model families (2026-11-08)

Source: `GET https://aapi.ai/api/pricing` (no account). Family = `vendors[].name` matched by `vendor_id`; `unknown` when `vendor_id` is absent. Sorted by family, then model id. **No prices.**

| Family | Model id |
| --- | --- |
| Alibaba | `qwen3.8-max` |
| Anthropic | `claude-fable-5-1` |
| Anthropic | `claude-haiku-5-5` |
| Anthropic | `claude-opus-4-8` |
| Anthropic | `claude-opus-5-5` |
| DeepSeek | `deepseek-v4-pro` |
| DeepSeek | `deepseek-v4.1-flash` |
| Moonshot | `kimi-k3` |
| OpenAI | `gpt-6-astra` |
| OpenAI | `gpt-6-sol` |
| OpenAI | `gpt-6.1-sol` |
| Zhipu AI | `glm-5.3` |
| Zhipu AI | `glm-5.3-flash` |
| Zhipu AI | `glm-5.3-flashx` |
| unknown | `kimi-k3.1-pro` |
| xAI | `grok-4.7` |

Vendors present in the same JSON payload (id → name): 35 DeepSeek, 36 Zhipu AI, 38 OpenAI, 39 Anthropic, 40 xAI, 41 字节跳动, 42 Alibaba, 43 Moonshot. Vendor 41 had no `data` rows on this fetch. Model `kimi-k3.1-pro` had no `vendor_id` → family `unknown` per protocol.

Official list prices: https://aapi.ai/pricing

## Latency snapshot

| UTC date | Model id | Family | Median total latency | p95 total latency | Samples | Region | HTTP errors |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-11-08 | needs API key | needs API key | needs API key | needs API key | needs API key | Asia/Shanghai (intended) | needs API key |

Notes: Measurement point planned as Asia/Shanghai box client on 2026-11-08. Suggested first model id after a key is available: `glm-5.3-flash` (public catalog id that day). Re-copy the id from https://aapi.ai/pricing on the measurement UTC date before publishing.

## Evidence

- Official prices and model ids: https://aapi.ai/pricing
- Catalog JSON: https://aapi.ai/api/pricing
- Where to read prices: https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.md
- Chat Completions URL: https://aapi.ai/v1/chat/completions
- Other probes on 2026-11-08: `GET /v1/models` → 401 (auth required); `GET /api/models` → 401; `GET /api/pricing/public` → 404. Public unauthenticated catalog used here is `/api/pricing` only.

中文: https://github.com/cozcc/aapi/blob/main/topics/primary-facts.zh-CN.md
