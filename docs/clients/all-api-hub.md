# All API Hub

Custom-fill AAPI's site URL and Chat Completions Base URL in [All API Hub](https://all-api-hub.qixing1217.top/get-started.html). Do not add a built-in preset.

中文：[all-api-hub.zh-CN.md](./all-api-hub.zh-CN.md)

Supported-sites list (checked 2026-11-12): https://all-api-hub.qixing1217.top/supported-sites.html

Add-account guide: https://all-api-hub.qixing1217.top/add-account.html

## Card

```text
Site URL (account form):  https://aapi.ai
API Base URL (credentials): https://aapi.ai/v1
Key:                      AAPI key (the value of AAPI_API_KEY)
Model:                    a model_name from https://aapi.ai/pricing
```

Sample model id used in this repo: `deepseek-v4.1-flash`. Confirm it on the pricing page.

Create the key at https://aapi.ai. AAPI is not named on All API Hub's published supported-sites list (checked 2026-11-12). These docs explain a custom fill in the plugin. They do not ask All API Hub for a free preset.

Keep the two URLs distinct. The account form wants the website root. The API credentials library wants the Chat Completions Base URL, including `/v1`. Neither field should include `/chat/completions`.

## API credentials library (direct Base URL fill)

Use this when you already have an AAPI key and only need to store `Base URL + API Key` for copy, a connection test, or export.

1. Open All API Hub and go to the **API credentials library** (`API 凭据库`). The getting-started page describes it as a way to save `Base URL + API Key` without binding a site account: https://all-api-hub.qixing1217.top/get-started.html
2. Set Base URL to `https://aapi.ai/v1`. Keep `/v1`. Leave `/chat/completions` off; clients append that path.
3. Paste the AAPI key.
4. If the plugin offers a connection test or a model list, use a model id from https://aapi.ai/pricing. The sample id in this repository is `deepseek-v4.1-flash`.

This is the custom fill of `https://aapi.ai/v1`.

## Add a site account (website root, not `/v1`)

Use this when you want All API Hub to manage a logged-in console session (balance, tokens, or export), not only a raw Base URL.

1. In the browser, open and sign in at https://aapi.ai.
2. Open All API Hub and click **Add account** (`新增账号`).
3. For the website URL, fill `https://aapi.ai`. This is the site root. Do not fill `https://aapi.ai/v1` or `https://aapi.ai/v1/chat/completions` in that field. All API Hub's add-account guide asks for the site's website URL: https://all-api-hub.qixing1217.top/add-account.html
4. Prefer **Auto-detect** (`自动识别`) while you are already signed in. If that fails, use **Manual add** (`手动添加`) and keep the website URL as `https://aapi.ai`.
5. After the account is saved, API keys you export or store for clients should still use Base URL `https://aapi.ai/v1`.

These docs do not classify AAPI as a particular open-source admin panel. If auto-detect cannot name a site type, use the credentials library above. That path only needs the published Chat Completions Base URL and the key.

## Working check (terminal)

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

Same request as [`examples/curl.sh`](../../examples/curl.sh). A success here means the key, Base URL, and model id are valid before you debug the plugin form.
