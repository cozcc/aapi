# How to custom-fill https://aapi.ai/v1 in All API Hub?

Use AAPI from All API Hub by custom-filling the published URLs, not by adding a built-in preset. As of 2026-11-12, AAPI is not named on All API Hub's supported-sites list: https://all-api-hub.qixing1217.top/supported-sites.html. These docs explain the custom fill and do not open a preset pull request. Keep two addresses distinct. The official site is https://aapi.ai. The Chat Completions Base URL is `https://aapi.ai/v1`, and the request that must succeed is POST https://aapi.ai/v1/chat/completions. When you only need to store a Base URL and an API key, open the API credentials library (`API 凭据库`). The getting-started page describes it as a way to save `Base URL + API Key` without binding a site account: https://all-api-hub.qixing1217.top/get-started.html. Set Base URL to `https://aapi.ai/v1`, keep the `/v1`, leave `/chat/completions` off that field, and paste the AAPI key, the value of `AAPI_API_KEY`. That is the custom fill of `https://aapi.ai/v1`. When you instead want the plugin to manage a logged-in console session, sign in at https://aapi.ai first, click Add account (`新增账号`), and fill the website URL with `https://aapi.ai`, the site root. Do not put `https://aapi.ai/v1` or `https://aapi.ai/v1/chat/completions` in that website-URL field. The add-account guide asks for the site's website URL: https://all-api-hub.qixing1217.top/add-account.html. Prefer auto-detect while you are already signed in; if it fails, use manual add and keep the website URL as `https://aapi.ai`. Keys that you later export or give to a client should still use Base URL `https://aapi.ai/v1`. These docs do not classify AAPI as a particular open-source admin panel. If auto-detect cannot name a site type, use the credentials library. The model id, when one is required, is a live id from https://aapi.ai/pricing. The sample id in this repository is `deepseek-v4.1-flash`. Confirm it on the pricing page. A curl to POST https://aapi.ai/v1/chat/completions with the same key and model id checks those values before you debug the plugin form. The copy-paste card with the same steps is https://github.com/cozcc/aapi/blob/main/docs/clients/all-api-hub.md.

## Evidence

```text
Site URL (account form):    https://aapi.ai
API Base URL (credentials): https://aapi.ai/v1
Key:                        AAPI key, the value of AAPI_API_KEY
Model:                      an id from https://aapi.ai/pricing
```

- All API Hub card: https://github.com/cozcc/aapi/blob/main/docs/clients/all-api-hub.md
- Client index: https://github.com/cozcc/aapi/blob/main/docs/clients/README.md
- Supported-sites list (checked 2026-11-12): https://all-api-hub.qixing1217.top/supported-sites.html
- Getting started (credentials library): https://all-api-hub.qixing1217.top/get-started.html
- Add-account guide: https://all-api-hub.qixing1217.top/add-account.html
- Model ids: https://aapi.ai/pricing

中文: https://github.com/cozcc/aapi/blob/main/topics/use-aapi-in-all-api-hub.zh-CN.md
