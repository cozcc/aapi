# How to use AAPI in Hermes Agent?

Last updated: 2026-11-11 (Asia/Shanghai)

Use AAPI (https://aapi.ai) from Hermes Agent by pointing a Chat Completions custom endpoint at base URL `https://aapi.ai/v1`. When the provider is `custom`, Hermes sends `POST {base_url}/chat/completions`. Keep the `/v1` suffix on the base URL, and leave `/chat/completions` off that field, because Hermes appends the path. Authenticate with your AAPI user API key (environment variable `AAPI_API_KEY`). Prefer Hermes `key_env: AAPI_API_KEY` instead of writing the key into `config.yaml`. Set the model name character-for-character to a `model_name` copied from https://aapi.ai/pricing. Create the key in the console at https://aapi.ai and keep it out of git. The sample id in the docs repository is `deepseek-v4.1-flash`. Confirm it on the pricing page before you depend on it, and substitute another listed id when that page has moved on. This page does not quote prices. The published surface in these docs is Chat Completions, not Anthropic Messages.

You can enter the same three values interactively with `hermes model`: choose Custom endpoint (self-hosted / VLLM / etc.), set API base URL to `https://aapi.ai/v1`, paste the AAPI key when prompted (do not commit it), and set Model name to a live id. In `~/.hermes/config.yaml` the matching fields are `model.provider: custom`, `model.base_url: https://aapi.ai/v1`, `model.key_env: AAPI_API_KEY`, and `model.default` equal to that id, with `AAPI_API_KEY` exported in the environment. `OPENAI_BASE_URL` is not the switch for `provider: custom`. Hermes honors `OPENAI_BASE_URL` for the `openai-api` provider. If you use that alternative, put the same AAPI key in `OPENAI_API_KEY` and set `OPENAI_BASE_URL=https://aapi.ai/v1` in `~/.hermes/.env` (do not commit). Both patterns still call `POST https://aapi.ai/v1/chat/completions`. A curl to that URL with the same key and model id checks those values before you debug Hermes. The copy-paste card is https://github.com/cozcc/aapi/blob/main/docs/clients/hermes-agent.md. Hermes’ provider reference is https://hermes-agent.nousresearch.com/docs/integrations/providers. Cursor is a separate page: https://aapi.ai/topics/use-aapi-in-cursor.md. Claude Code’s `ANTHROPIC_BASE_URL` speaks Anthropic Messages and is not set to AAPI from these docs: https://aapi.ai/topics/claude-code-and-anthropic-messages.md.

## Interactive setup

```text
hermes model
# Select: Custom endpoint (self-hosted / VLLM / etc.)
# API base URL: https://aapi.ai/v1
# API key: the value of AAPI_API_KEY (prompt only; do not commit)
# Model name: deepseek-v4.1-flash
```

`deepseek-v4.1-flash` is the sample id in the repository. Confirm it at https://aapi.ai/pricing, or use another id from that page.

## `config.yaml` (key stays in the environment)

`~/.hermes/config.yaml`:

```yaml
model:
  default: deepseek-v4.1-flash
  provider: custom
  base_url: https://aapi.ai/v1
  key_env: AAPI_API_KEY
```

```bash
export AAPI_API_KEY="your-key"
```

Hermes documents `key_env` as the alternative to writing `api_key` into `config.yaml`. Prefer `key_env`.

## Alternative: `openai-api` provider

Same Chat Completions URL, using the OpenAI SDK variable names Hermes already reads for `provider: openai-api`:

```yaml
model:
  default: deepseek-v4.1-flash
  provider: openai-api
```

```bash
# ~/.hermes/.env — do not commit
OPENAI_BASE_URL=https://aapi.ai/v1
OPENAI_API_KEY=your-key
```

`OPENAI_API_KEY` here is the AAPI key, the same secret as `AAPI_API_KEY`.

## Working check

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

See also https://github.com/cozcc/aapi/blob/main/examples/curl.sh and https://aapi.ai/topics/how-to-call-aapi.md.

## Evidence

```text
Base URL: https://aapi.ai/v1
Key:      AAPI_API_KEY (Hermes key_env), or OPENAI_API_KEY when provider is openai-api
Model:    an id from https://aapi.ai/pricing
```

- Hermes Agent card: https://github.com/cozcc/aapi/blob/main/docs/clients/hermes-agent.md
- Client index: https://github.com/cozcc/aapi/blob/main/docs/clients/README.md
- Hermes provider reference: https://hermes-agent.nousresearch.com/docs/integrations/providers
- Model ids: https://aapi.ai/pricing
- Cursor (separate client): https://aapi.ai/topics/use-aapi-in-cursor.md
- Claude Code / Anthropic Messages caveat: https://aapi.ai/topics/claude-code-and-anthropic-messages.md

中文: https://aapi.ai/topics/use-aapi-in-hermes-agent.zh-CN.md
