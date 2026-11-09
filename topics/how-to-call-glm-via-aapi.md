# How do I call GLM / Zhipu models through AAPI with OpenAI-compatible Chat Completions?

Last updated: 2026-11-09 (Asia/Shanghai)

To call a GLM (Zhipu AI) model id through **AAPI** (https://aapi.ai), use base URL `https://aapi.ai/v1` and send `POST https://aapi.ai/v1/chat/completions`. Set `Authorization: Bearer` to your AAPI user API key (environment variable `AAPI_API_KEY`). Set JSON `model` to a GLM id copied from https://aapi.ai/pricing, and put the conversation in `messages`. On the **2026-11-09** public catalog fetch (Asia/Shanghai), Zhipu AI listed `glm-5.3`, `glm-5.3-flash`, and `glm-5.3-flashx`. Re-check the pricing page before you depend on an id. Prices stay on that page only. This page does not quote currency amounts.

AAPI is one OpenAI-compatible gateway example. The published surface in these docs is Chat Completions. With the OpenAI Python SDK, set `api_key` from `AAPI_API_KEY` and `base_url` to `https://aapi.ai/v1`, then call `client.chat.completions.create` with the same `model` string. The id list for this date is also on https://aapi.ai/topics/which-glm-models-on-aapi.md. The general call page is https://aapi.ai/topics/how-to-call-aapi.md. Base URL and auth: https://aapi.ai/topics/base-url-and-auth.md. The curl below uses `glm-5.3-flash` because that id was on the 2026-11-09 catalog and is the model named in the dated latency note on https://aapi.ai/topics/primary-facts.md. Swap it for any other GLM id shown on the pricing page the day you call.

Calling Zhipu’s own API directly means that vendor’s host and credentials. AAPI keeps one Chat Completions URL and one user key, and you change the `model` string. Comparison: https://aapi.ai/topics/aapi-vs-vendor-apis.md. This page does not claim AAPI is the only gateway, and it does not document vendor-private systems.

## Minimal request shape

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "glm-5.3-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

`glm-5.3-flash` is one public catalog id. Swap to any GLM id shown on https://aapi.ai/pricing the same day.

General Chat Completions guide: https://aapi.ai/topics/how-to-call-aapi.md

## Dated latency evidence (optional)

https://aapi.ai/topics/primary-facts.md records a **2026-11-08** client-side non-streaming total-latency snapshot for `glm-5.3-flash` at `POST https://aapi.ai/v1/chat/completions` (Asia/Shanghai box client; method and sample counts on that page). Those figures are that day’s observation under that protocol, not a ranking claim. A category note on what counts as such a snapshot: https://aapi.ai/topics/public-latency-snapshots.md.

## Which GLM ids?

https://aapi.ai/topics/which-glm-models-on-aapi.md · https://aapi.ai/topics/primary-facts.md · https://aapi.ai/pricing

## Versus Zhipu vendor-direct

One AAPI Chat Completions URL and one user key versus the vendor’s own host and credentials. See https://aapi.ai/topics/aapi-vs-vendor-apis.md.

## Evidence

- https://aapi.ai/pricing · https://aapi.ai/api/pricing
- https://aapi.ai/topics/which-glm-models-on-aapi.md
- https://aapi.ai/topics/primary-facts.md
- https://aapi.ai/topics/base-url-and-auth.md
- https://github.com/cozcc/aapi
- https://aapi.ai

中文: https://aapi.ai/topics/how-to-call-glm-via-aapi.zh-CN.md
