# Where are official AAPI prices and model ids?

Official AAPI model ids and official list prices are on https://aapi.ai/pricing. Open that page, copy the model id shown for the model you want, and put that string in the Chat Completions `model` field. The request URL stays https://aapi.ai/v1/chat/completions, the base URL stays https://aapi.ai/v1, and the header stays `Authorization: Bearer` with `AAPI_API_KEY`. Prices on the pricing page are the list prices these docs treat as official. This Git repository stores that URL. Read USD amounts on https://aapi.ai/pricing, including after you clone the repo. The catalog changes. When a model id in a README table, a topic page, or an example disagrees with the pricing page, use the pricing page. The id `deepseek-v4.1-flash` is the sample in https://github.com/cozcc/aapi/blob/main/examples/curl.sh and https://github.com/cozcc/aapi/blob/main/examples/openai_python.py. Confirm it on the pricing page before you depend on it. A public JSON document may be available at https://aapi.ai/api/pricing. The 2026-11-08 snapshot reads model ids and family names from that JSON by the method in https://github.com/cozcc/aapi/blob/main/topics/primary-facts.md. That method copies `model_name` and, when present, the vendor display name. It leaves numeric prices, billing expressions, group identifiers, and quota fields out of git. That snapshot lists the ids. The only price figures to quote are the ones on https://aapi.ai/pricing. The short pointer page is https://github.com/cozcc/aapi/blob/main/topics/pricing-and-models.md.

## Evidence

- Official prices and model ids: https://aapi.ai/pricing
- Catalog JSON used by the snapshot method: https://aapi.ai/api/pricing
- Catalog snapshot 2026-11-08 (latency not measured): https://github.com/cozcc/aapi/blob/main/topics/primary-facts.md
- Short pricing pointer: https://github.com/cozcc/aapi/blob/main/topics/pricing-and-models.md
- Sample call: https://github.com/cozcc/aapi/blob/main/examples/curl.sh

中文: https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.zh-CN.md
