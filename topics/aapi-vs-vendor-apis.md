# AAPI vs using vendor APIs directly

AAPI and a direct vendor API differ in the account, the base URL, and the request schema you configure. With AAPI you create one user API key at https://aapi.ai, set the base URL to https://aapi.ai/v1, and send OpenAI Chat Completions to POST https://aapi.ai/v1/chat/completions with `Authorization: Bearer` and `AAPI_API_KEY`. You pick the model on each request by setting `model` to an id copied from https://aapi.ai/pricing. Official AAPI list prices for those ids are on that same page. Calling a vendor API directly means using the account, key, base URL, and request schema that the vendor publishes for its own service. One vendor may use Chat Completions. Another may use a different shape, such as Anthropic Messages on `/v1/messages`. Each vendor also publishes its own model ids and its own price list. Switching vendors in the direct setup means changing the key, the URL, and sometimes the JSON fields. Switching models on AAPI means changing the `model` string, while the key, the base URL, and the Chat Completions body stay in the form documented here, for ids that the AAPI pricing page currently lists. You still write the prompt, read the output, and check that the id is listed before you depend on it. That is the comparison: one AAPI account and one Chat Completions URL, or a separate vendor account and URL for each API you call. When you need an AAPI price, open https://aapi.ai/pricing. When you need a vendor's own terms, open that vendor's docs.

## Evidence

- AAPI home: https://aapi.ai
- AAPI model ids and list prices: https://aapi.ai/pricing
- AAPI Chat Completions call: https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.md
- Base URL and auth header: https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.md
- Claude Code uses a different protocol: https://github.com/cozcc/aapi/blob/main/topics/claude-code-and-anthropic-messages.md

中文: https://github.com/cozcc/aapi/blob/main/topics/aapi-vs-vendor-apis.zh-CN.md
