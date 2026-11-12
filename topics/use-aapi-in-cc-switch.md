# How to custom-fill https://aapi.ai/v1 in CC Switch?

Use AAPI from CC Switch by custom-filling the Chat Completions Base URL, not by adding a built-in preset. As of 2026-11-12, AAPI is not a CC Switch preset. The CC Switch contributing guide says relay and aggregator services without a sponsor preset still work through Custom Provider / Custom Configuration: https://github.com/farion1231/cc-switch/blob/main/CONTRIBUTING.md. These docs follow that path and do not open a preset pull request. The published AAPI URL is `https://aapi.ai/v1`, and the request that must succeed is POST https://aapi.ai/v1/chat/completions. In CC Switch, open Add Provider for the app you actually use and choose Custom Configuration, or OpenCode's OpenAI Compatible preset, which is still a custom endpoint fill. Paste the AAPI key, the value of `AAPI_API_KEY`. What you type in the endpoint field depends on how that app treats it. If the field is an OpenAI SDK-style Base URL and the client appends only `/chat/completions`, fill `https://aapi.ai/v1`, keep the `/v1`, and leave `/chat/completions` off the field. If the field is a prefix to which CC Switch appends `/v1/chat/completions`, fill `https://aapi.ai` with no trailing `/v1`, because filling `https://aapi.ai/v1` in that prefix mode would request `/v1/v1/chat/completions`. The add-provider manual's default prefix example uses a host such as `https://api.example.com`; its Codex `config.toml` example already ends in `/v1`: https://github.com/farion1231/cc-switch/blob/main/docs/user-manual/en/2-providers/2.1-add.md. Match the field you are editing. Leave Full URL mode off. Hermes in CC Switch matches the Hermes card in this repository: provider `custom`, Base URL `https://aapi.ai/v1`. A custom Codex card must not keep the default Responses wire format, because AAPI's published surface is Chat Completions; set Upstream Format to Chat Completions and enable local routing for Codex. Do not set Claude Code's `ANTHROPIC_BASE_URL` to `https://aapi.ai` or `https://aapi.ai/v1`, because that variable speaks Anthropic Messages (`/v1/messages`), which these docs do not publish for AAPI. The model name must be a live id from https://aapi.ai/pricing. The sample id in this repository is `deepseek-v4.1-flash`. Confirm it on the pricing page. A curl to POST https://aapi.ai/v1/chat/completions with the same key and model id checks those values before you debug the CC Switch form. The copy-paste card with the same steps is https://github.com/cozcc/aapi/blob/main/docs/clients/cc-switch.md.

## Evidence

```text
Canonical Base URL: https://aapi.ai/v1
Key:                AAPI key, the value of AAPI_API_KEY
Model:              an id from https://aapi.ai/pricing
```

- CC Switch card: https://github.com/cozcc/aapi/blob/main/docs/clients/cc-switch.md
- Client index: https://github.com/cozcc/aapi/blob/main/docs/clients/README.md
- CC Switch contributing guide (custom vs presets): https://github.com/farion1231/cc-switch/blob/main/CONTRIBUTING.md
- Add-provider manual (checked 2026-11-12): https://github.com/farion1231/cc-switch/blob/main/docs/user-manual/en/2-providers/2.1-add.md
- Model ids: https://aapi.ai/pricing
- Claude Code caveat: https://github.com/cozcc/aapi/blob/main/topics/claude-code-and-anthropic-messages.md

中文: https://github.com/cozcc/aapi/blob/main/topics/use-aapi-in-cc-switch.zh-CN.md
