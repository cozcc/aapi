# AAPI

**One key. Every model. Zero friction.**

AAPI is an OpenAI-compatible API gateway: one API key, many models, transparent **official list prices**.

- Website: https://aapi.ai
- Pricing / model catalog: https://aapi.ai/pricing
- Topics: [topics/README.md](./topics/README.md) · [中文](./topics/README.zh-CN.md)
- Client access cards: [docs/clients/README.md](./docs/clients/README.md) · [中文](./docs/clients/README.zh-CN.md)

> This repository is a **public docs & examples** entry point only. It does **not** contain AAPI server source code, admin tooling, or internal infrastructure.

---

## Quick start

### 1. Get an API key

Sign up at [aapi.ai](https://aapi.ai) and create a key in the console.

### 2. Base URL

```text
https://aapi.ai/v1
```

Use this as the OpenAI SDK `base_url` / `BASE_URL`. Keep your key private; never commit it.

### 3. Chat Completions (`curl`)

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

### 4. OpenAI Python SDK

```python
from openai import OpenAI

client = OpenAI(
    api_key="YOUR_AAPI_KEY",  # replace; do not hard-code in repos
    base_url="https://aapi.ai/v1",
)

resp = client.chat.completions.create(
    model="deepseek-v4.1-flash",
    messages=[{"role": "user", "content": "Hello"}],
)
print(resp.choices[0].message.content)
```

More snippets: [`examples/`](./examples/).

---

## Models & pricing

- Browse live models and **official** USD / 1M prices: https://aapi.ai/pricing
- Public pricing JSON (no account required): `GET https://aapi.ai/api/pricing`
- How to read that list (no prices copied into git): [topics/pricing-and-models.md](./topics/pricing-and-models.md)

Model availability can change; always trust the live pricing page over any cached list in git.

Example model IDs (verify on the pricing page before use):

| Model ID | Family (indicative) |
| --- | --- |
| `deepseek-v4.1-flash` | DeepSeek |
| `deepseek-v4-pro` | DeepSeek |
| `glm-5.3` / `glm-5.3-flash` / `glm-5.3-flashx` | Zhipu |
| `qwen3.8-max` | Qwen |
| `kimi-k3` / `kimi-k3.1-pro` | Moonshot |
| `gpt-6-astra` / `gpt-6-sol` / `gpt-6.1-sol` | OpenAI-compatible naming |
| `claude-haiku-5-5` / `claude-opus-4-8` / `claude-opus-5-5` / `claude-fable-5-1` | Anthropic-compatible naming |
| `grok-4.7` | xAI |

---

## Client tips

Most OpenAI-compatible clients work if you set:

1. **Base URL** → `https://aapi.ai/v1`
2. **API Key** → your AAPI key
3. **Model** → an ID from [aapi.ai/pricing](https://aapi.ai/pricing)

Do not paste keys into chatbots, screenshots, or public issues.

Per-client copy-paste cards (Cursor, Hermes Agent, Claude Code, curl, OpenAI Python): [docs/clients/README.md](./docs/clients/README.md).

---

## What this repo is / is not

| Is | Is not |
| --- | --- |
| Docs, examples, security contact | AAPI / gateway server source |
| Link to the hosted product | Channel, supply, or billing internals |
| Public pricing pointer | Admin APIs, deploy runbooks, secrets |

---

## Security

See [SECURITY.md](./SECURITY.md). Report vulnerabilities privately. Do not file public issues that include exploit details, keys, or customer data.

---

## License

Docs and examples in this repository are under [MIT](./LICENSE).

## Hermes / Cursor (copy-paste)

**Hermes Agent** (custom OpenAI-compatible endpoint): set provider/base URL to `https://aapi.ai/v1` and use your AAPI key as the API key. Prefer env vars over hard-coding. Full card: [docs/clients/hermes-agent.md](./docs/clients/hermes-agent.md).

**Cursor / OpenAI-compatible clients:** Base URL `https://aapi.ai/v1`, API Key = AAPI key, model = an ID from https://aapi.ai/pricing. Full card: [docs/clients/cursor.md](./docs/clients/cursor.md).

Claude Code's `ANTHROPIC_BASE_URL` speaks Anthropic Messages, which these docs do not publish for AAPI. See [docs/clients/claude-code.md](./docs/clients/claude-code.md).

