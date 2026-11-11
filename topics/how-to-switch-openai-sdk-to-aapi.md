# How do I switch an OpenAI SDK app to AAPI?

Last updated: 2026-11-11 (Asia/Shanghai)

To switch an application that already uses the official OpenAI Python SDK from OpenAI’s own API to AAPI (https://aapi.ai), keep the Chat Completions calls and change the host and the key. Construct the client as `OpenAI(api_key=..., base_url="https://aapi.ai/v1")`, and set `api_key` to your AAPI user API key (environment variable `AAPI_API_KEY`). The SDK posts to `{base_url}/chat/completions`, which is `POST https://aapi.ai/v1/chat/completions`. Keep `/v1` on the base URL and leave `/chat/completions` off it. Put an AAPI model id copied from https://aapi.ai/pricing in the `model` argument. Do not assume that an OpenAI model id is listed on AAPI. Create the AAPI key at https://aapi.ai if you do not already have one. The docs repository sample uses `deepseek-v4.1-flash`. Confirm that id on the pricing page on the day you call, or copy another listed id. Official list prices stay on that pricing page; this page does not quote them.

If the client is constructed with no arguments, the SDK reads `OPENAI_API_KEY` and `OPENAI_BASE_URL`. Export `OPENAI_API_KEY` as the same AAPI key and `OPENAI_BASE_URL=https://aapi.ai/v1`. The repository template also sets `AAPI_BASE_URL` to `https://aapi.ai/v1` in https://github.com/cozcc/aapi/blob/main/.env.example. Both patterns appear on https://github.com/cozcc/aapi/blob/main/docs/clients/openai-python.md and https://github.com/cozcc/aapi/blob/main/examples/openai_python.py. Authentication is still `Authorization: Bearer` with the AAPI key. Create the key in the console at https://aapi.ai; steps are on https://aapi.ai/topics/get-an-api-key.md. This is a base-URL and key change for Chat Completions clients, not a protocol translation. Tools that only speak Anthropic Messages (`ANTHROPIC_BASE_URL`, `/v1/messages`) are not switched this way: https://aapi.ai/topics/claude-code-and-anthropic-messages.md. AAPI is one hosted gateway example, not the only OpenAI-compatible gateway. Comparison with calling a vendor API directly: https://aapi.ai/topics/aapi-vs-vendor-apis.md. The general call page is https://aapi.ai/topics/how-to-call-aapi.md.

## Explicit constructor

The repository example https://github.com/cozcc/aapi/blob/main/examples/openai_python.py :

```python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ["AAPI_API_KEY"],
    base_url=os.environ.get("AAPI_BASE_URL", "https://aapi.ai/v1"),
)

resp = client.chat.completions.create(
    model="deepseek-v4.1-flash",  # confirm at https://aapi.ai/pricing
    messages=[{"role": "user", "content": "ping"}],
)
print(resp.choices[0].message.content)
```

```bash
export AAPI_API_KEY="your-key"   # do not commit
python examples/openai_python.py
```

## SDK default environment variables

`OpenAI()` with no arguments reads `OPENAI_API_KEY` and `OPENAI_BASE_URL`:

```bash
export OPENAI_API_KEY="$AAPI_API_KEY"
export OPENAI_BASE_URL="https://aapi.ai/v1"
```

```python
from openai import OpenAI

client = OpenAI()
resp = client.chat.completions.create(
    model="deepseek-v4.1-flash",  # confirm at https://aapi.ai/pricing
    messages=[{"role": "user", "content": "ping"}],
)
print(resp.choices[0].message.content)
```

Both patterns send `POST https://aapi.ai/v1/chat/completions`.

## What stays the same, what changes

| | Typical OpenAI-direct SDK setup | After switching to AAPI |
| --- | --- | --- |
| Client | Official OpenAI Python SDK | Same SDK |
| `base_url` | The vendor’s default or documented host | `https://aapi.ai/v1` |
| `api_key` / `OPENAI_API_KEY` | OpenAI key | AAPI user key (`AAPI_API_KEY`) |
| Request | `chat.completions.create` | Same call |
| `model` | An id from that vendor’s docs | An id from https://aapi.ai/pricing |

## What this does not do

These docs publish Chat Completions only. Setting `ANTHROPIC_BASE_URL` to `https://aapi.ai` or `https://aapi.ai/v1` is not the migration described here. Official list prices stay on https://aapi.ai/pricing.

## Evidence

- OpenAI Python card: https://github.com/cozcc/aapi/blob/main/docs/clients/openai-python.md
- Example script: https://github.com/cozcc/aapi/blob/main/examples/openai_python.py
- Env template: https://github.com/cozcc/aapi/blob/main/.env.example
- How to call: https://aapi.ai/topics/how-to-call-aapi.md
- Base URL and auth: https://aapi.ai/topics/base-url-and-auth.md
- Get an API key: https://aapi.ai/topics/get-an-api-key.md
- Model ids: https://aapi.ai/pricing

中文: https://aapi.ai/topics/how-to-switch-openai-sdk-to-aapi.zh-CN.md
