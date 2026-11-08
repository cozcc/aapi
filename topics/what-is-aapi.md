# What is AAPI?

AAPI is the hosted API at https://aapi.ai. You use one user API key and the OpenAI-compatible base URL https://aapi.ai/v1 to call model ids published on https://aapi.ai/pricing. The documented request is HTTP POST https://aapi.ai/v1/chat/completions. Send the header `Authorization: Bearer` with the key you stored in the environment variable `AAPI_API_KEY`, and send a JSON body whose `model` field is an id copied from the pricing page and whose `messages` field is the conversation. AAPI is the account and the URL in front of those ids. Model names on the pricing page identify the upstream models; this repository does not describe AAPI as a model trainer. The GitHub project https://github.com/cozcc/aapi is the public documentation and examples entry point. It holds client snippets, topic pages, and a security contact. Server source, admin tools, and deployment notes sit outside this repository. Official list prices are the figures shown on https://aapi.ai/pricing. Read them there when you need a price. The sample model id in the repository examples is `deepseek-v4.1-flash`. Treat that string as a sample and confirm it on the pricing page before you depend on it. curl, the OpenAI Python SDK, Cursor's Override OpenAI Base URL setting, and Hermes Agent's custom endpoint all use this same Chat Completions base URL and the same key. Claude Code is documented on its own page because `ANTHROPIC_BASE_URL` expects Anthropic Messages on `/v1/messages`, while the published AAPI surface in these docs is Chat Completions. Sign up at https://aapi.ai and create the key in the console.

## Evidence

- Product home and console: https://aapi.ai
- Official model ids and list prices: https://aapi.ai/pricing
- Docs repository: https://github.com/cozcc/aapi
- English quick start: https://github.com/cozcc/aapi/blob/main/README.md
- Chat Completions call: https://github.com/cozcc/aapi/blob/main/topics/how-to-call-aapi.md
- Base URL and auth header: https://github.com/cozcc/aapi/blob/main/topics/base-url-and-auth.md

中文: https://github.com/cozcc/aapi/blob/main/topics/what-is-aapi.zh-CN.md
