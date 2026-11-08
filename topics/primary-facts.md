# AAPI primary facts snapshot (method)

Last updated: 2026-11-08

This page is a method stub for a recurring public snapshot, for example once a week. A filled snapshot lists public model ids and family names, links to official prices, and records client-side latency only after a real measurement. The 2026-11-08 row is a placeholder. Numbers filled when measured. USD amounts stay on https://aapi.ai/pricing and are omitted from this file.

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

## How to measure latency

Publish a latency figure only when a run that follows this protocol produced it. The text until then is `numbers filled when measured`.

- Call `POST https://aapi.ai/v1/chat/completions` with `Authorization: Bearer` and the key in `AAPI_API_KEY`. The published note omits the key.
- Send non-streaming JSON: `temperature` 0, one user message whose content is `ping`, and a `model` id copied from https://aapi.ai/pricing on the same UTC date.
- Total latency is the client wall-clock time from the start of the request until the response body is complete, in milliseconds.
- Streaming time-to-first-byte is a separate metric. This method records non-streaming total latency.
- Discard 1 warmup call. Then send 20 sequential calls.
- Record the sample count, the median, the 95th percentile, the HTTP error count, the client region in plain language, and the UTC date.
- Count failed attempts in the attempt total, and publish the error count beside the latency.
- State the client and the region in the notes. One sample is a single observation, and the published row uses the 20-call set above.

## Snapshot

| UTC date | Model id | Family | Median total latency | p95 total latency | Samples | Region | HTTP errors |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-11-08 | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured |

## Evidence

- Official prices and model ids: https://aapi.ai/pricing
- Catalog JSON: https://aapi.ai/api/pricing
- Where to read prices: https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.md
- Chat Completions URL: https://aapi.ai/v1/chat/completions

中文: https://github.com/cozcc/aapi/blob/main/topics/primary-facts.zh-CN.md
