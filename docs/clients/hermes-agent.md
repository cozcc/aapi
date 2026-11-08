# Hermes Agent

Custom OpenAI-compatible endpoint. Hermes calls `POST {base_url}/chat/completions` when the provider is `custom`.

中文：[hermes-agent.zh-CN.md](./hermes-agent.zh-CN.md)

Provider reference: https://hermes-agent.nousresearch.com/docs/integrations/providers

## Card

```text
Base URL: https://aapi.ai/v1
Key env:  AAPI_API_KEY
Model:    a model_name from https://aapi.ai/pricing
```

Sample model id used in this repo: `deepseek-v4.1-flash`. Confirm it on the pricing page.

## Interactive setup

```text
hermes model
# Select: Custom endpoint (self-hosted / VLLM / etc.)
# API base URL: https://aapi.ai/v1
# API key: the value of AAPI_API_KEY (prompt only; do not commit)
# Model name: deepseek-v4.1-flash
```

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

`OPENAI_BASE_URL` is not the switch for `provider: custom`. Hermes honors `OPENAI_BASE_URL` for the `openai-api` provider. For a custom endpoint, set `model.base_url` as above (or pass the URL in `hermes model`).

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

See also [`examples/curl.sh`](../../examples/curl.sh).
