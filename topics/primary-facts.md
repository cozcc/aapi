# AAPI primary facts snapshot

Last updated: 2026-11-12 (Asia/Shanghai)

This page is a recurring public snapshot. It lists public model ids and family names from the catalog JSON, links to official prices, and records client-side latency only after a real measurement. USD amounts stay on https://aapi.ai/pricing and are omitted from this file. Re-check https://aapi.ai/pricing before you depend on an id.

**Catalog fetch (this snapshot):** `GET https://aapi.ai/api/pricing` → HTTP 200 `application/json` at 2026-11-12 11:26:11 Asia/Shanghai (UTC 2026-11-12T03:26:11Z). Success payload with `data` (14 model ids) + `vendors` (8).

**Latency (this snapshot):** not remeasured on 2026-11-12. The last published run remains 2026-11-08 19:26:10 CST (Asia/Shanghai) from the Asia/Shanghai box client. Non-streaming total latency for `glm-5.3-flash` (Zhipu AI family) at `POST https://aapi.ai/v1/chat/completions`: median 2930 ms, p95 3814 ms, 20 samples after 1 warmup discarded, 0 HTTP errors. Total latency is client wall-clock from the start of the request until the response body is complete (`temperature` 0, one user message `ping`). These figures are that non-streaming total on that date, not streaming time-to-first-byte.

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

## Public model families (2026-11-12)

Source: `GET https://aapi.ai/api/pricing` (no account) at 2026-11-12 11:26:11 Asia/Shanghai (UTC 2026-11-12T03:26:11Z). Family = `vendors[].name` matched by `vendor_id`; `unknown` when `vendor_id` is absent. Sorted by family, then model id. **No prices.**

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

Vendors present in the same JSON payload (id → name): 35 DeepSeek, 36 Zhipu AI, 38 OpenAI, 39 Anthropic, 40 xAI, 41 字节跳动, 42 Alibaba, 43 Moonshot. Vendor 40 (xAI) and vendor 41 (字节跳动) had no `data` rows on this fetch. Model `kimi-k3.1-pro` had no `vendor_id` → family `unknown` per protocol.

The 2026-11-08 snapshot on this page listed `deepseek-v4-pro` (DeepSeek) and `grok-4.7` (xAI). Those two ids are not in the 2026-11-12 list. This page does not explain that change. Re-check https://aapi.ai/pricing.

Official list prices: https://aapi.ai/pricing

## Latency snapshot

No new latency row was measured for 2026-11-12. The row below is the 2026-11-08 run.

| UTC date | Model id | Family | Median total latency | p95 total latency | Samples | Region | HTTP errors |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-11-08 | `glm-5.3-flash` | Zhipu AI | 2930 ms | 3814 ms | 20 | Asia/Shanghai (box client) | 0 |

Notes: Non-streaming total latency on UTC date 2026-11-08, measured at 2026-11-08 19:26:10 CST (Asia/Shanghai). Endpoint `POST https://aapi.ai/v1/chat/completions`, model `glm-5.3-flash` (Zhipu AI), `temperature` 0, user message `ping`. Total = client wall-clock until the response body is complete. Warmup discarded: 1. Samples: 20. HTTP errors: 0. Min 2357 ms, max 4388 ms. Region: Asia/Shanghai (box client). Streaming time-to-first-byte is a separate metric and is not this row.

## Evidence

- Official prices and model ids: https://aapi.ai/pricing
- Catalog JSON: https://aapi.ai/api/pricing
- Where to read prices: https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.md
- Chat Completions URL: https://aapi.ai/v1/chat/completions
- Other probes on 2026-11-12: `GET /v1/models` → 401 (auth required); `GET /api/models` → 401; `GET /api/pricing/public` → 404. Public unauthenticated catalog used here is `/api/pricing` only.

中文: https://github.com/cozcc/aapi/blob/main/topics/primary-facts.zh-CN.md
