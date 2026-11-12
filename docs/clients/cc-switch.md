# CC Switch

Custom-fill AAPI's Chat Completions Base URL in [CC Switch](https://github.com/farion1231/cc-switch). Do not add a built-in preset.

中文：[cc-switch.zh-CN.md](./cc-switch.zh-CN.md)

CC Switch contributing guide (custom provider vs presets): https://github.com/farion1231/cc-switch/blob/main/CONTRIBUTING.md

Add-provider manual (checked 2026-11-12): https://github.com/farion1231/cc-switch/blob/main/docs/user-manual/en/2-providers/2.1-add.md · https://ccswitch.io/en/docs?item=add&section=providers

## Card

```text
Canonical Base URL: https://aapi.ai/v1
Key:                AAPI key (the value of AAPI_API_KEY)
Model:              a model_name from https://aapi.ai/pricing
```

Sample model id used in this repo: `deepseek-v4.1-flash`. Confirm it on the pricing page.

AAPI is not a built-in CC Switch preset (checked 2026-11-12 against the contributing guide and the add-provider manual). CC Switch says relay and aggregator services without a sponsor preset still work through Custom Provider / Custom Configuration. These docs explain that custom fill. They do not ask the CC Switch project for a free preset.

## What to type in the endpoint field

The request that must succeed is `POST https://aapi.ai/v1/chat/completions`. What you type in CC Switch depends on how that app treats the field:

- If the field is an OpenAI SDK-style Base URL, and the client appends only `/chat/completions`, fill `https://aapi.ai/v1`. Keep the `/v1`. Leave `/chat/completions` off the field.
- If the field is a prefix to which CC Switch appends `/v1/chat/completions`, fill `https://aapi.ai` (no trailing `/v1`). Filling `https://aapi.ai/v1` in that prefix mode would request `/v1/v1/chat/completions`.
- The add-provider manual's default (prefix) example uses a host such as `https://api.example.com`, which becomes `https://api.example.com/v1/chat/completions`. The same manual's Codex `config.toml` example uses a Base URL that already ends in `/v1`. Match the field you are editing, not a single typography for every app.
- Leave **Full URL** mode off. That mode is for a complete non-standard path and requires local routing. AAPI's published path is the ordinary Chat Completions URL above.

## Apps that fit this Chat Completions URL

1. Open **Add Provider** for the app you actually use.
2. In step 1, choose **Custom Configuration** (or OpenCode's **OpenAI Compatible** preset, which is still a custom endpoint fill, not an AAPI built-in).
3. Paste the AAPI key into the API Key field.
4. Fill the endpoint as in the previous section so the outgoing request is `POST https://aapi.ai/v1/chat/completions`.
5. Set the model to a live `model_name` from https://aapi.ai/pricing.

**Hermes** in CC Switch writes a custom provider. That path matches the Hermes card in this repo: provider `custom`, Base URL `https://aapi.ai/v1`. See [hermes-agent.md](./hermes-agent.md).

**Codex**: CC Switch defaults a custom Codex `wire_api` to Responses. AAPI's published surface is Chat Completions, not Responses. For a custom Codex card, set Upstream Format to **Chat Completions** and enable local routing for Codex, as the add-provider manual requires for Chat Completions upstreams. Set `base_url` so the converted request still reaches `https://aapi.ai/v1/chat/completions`.

## What not to fill

Claude Code's `ANTHROPIC_BASE_URL` speaks Anthropic Messages (`/v1/messages`). These docs do not publish that protocol for AAPI. Do not set `ANTHROPIC_BASE_URL` to `https://aapi.ai` or `https://aapi.ai/v1`. Use a Chat Completions app above, or see [claude-code.md](./claude-code.md).

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

Same request as [`examples/curl.sh`](../../examples/curl.sh). A success here means the key, Base URL, and model id are valid before you debug CC Switch's form. Menu labels move between CC Switch versions; the values that have to match are the resulting Chat Completions URL, the AAPI key, and a model id from the pricing page.
