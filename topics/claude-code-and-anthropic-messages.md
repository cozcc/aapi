# Does AAPI support Claude Code / Anthropic Messages?

The published AAPI surface in this repository is OpenAI-compatible Chat Completions. The request is POST https://aapi.ai/v1/chat/completions, the base URL is https://aapi.ai/v1, and the header is `Authorization: Bearer` with the key in `AAPI_API_KEY`. Claude Code's custom gateway variable is `ANTHROPIC_BASE_URL`. Claude Code's own gateway documentation says a gateway selected with that variable implements Anthropic Messages, including `/v1/messages`, and that Claude Code appends `/v1/messages` itself: https://code.claude.com/docs/en/llm-gateway-protocol. Anthropic Messages and OpenAI Chat Completions are different request paths and different JSON bodies. These AAPI docs publish the Chat Completions URL. They do not publish an Anthropic Messages base URL for AAPI. `ANTHROPIC_BASE_URL` is therefore not set to `https://aapi.ai` or `https://aapi.ai/v1` from these docs. A model id on https://aapi.ai/pricing may contain a Claude-style name. You can send that id in the Chat Completions `model` field when the pricing page lists it, from curl, the OpenAI Python SDK, Cursor's OpenAI base-URL override, or Hermes Agent's custom endpoint. That call is still Chat Completions. It is the protocol on the client card at https://github.com/cozcc/aapi/blob/main/docs/clients/claude-code.md, which points Claude Code users who need AAPI at those Chat Completions clients. If your tool can send only `/v1/messages`, the published AAPI docs stop at Chat Completions and the working path they show is one of those clients.

## Evidence

- Claude Code card: https://github.com/cozcc/aapi/blob/main/docs/clients/claude-code.md
- Claude Code gateway protocol: https://code.claude.com/docs/en/llm-gateway-protocol
- Chat Completions call: https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.md
- Cursor card: https://github.com/cozcc/aapi/blob/main/docs/clients/cursor.md
- Model ids: https://aapi.ai/pricing

中文: https://github.com/cozcc/aapi/blob/main/topics/claude-code-and-anthropic-messages.zh-CN.md
