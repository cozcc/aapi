# How to use AAPI in Cursor?

Use AAPI from Cursor by pointing Cursor's OpenAI-compatible settings at the Chat Completions base URL. Open Cursor Settings, then Models. Paste the AAPI key, the value of `AAPI_API_KEY`, into the OpenAI API Key field and save it. Enable Override OpenAI Base URL and set the value to `https://aapi.ai/v1`. Keep the `/v1` suffix. Leave `/chat/completions` off that field, because Cursor appends the path and the resulting request is POST https://aapi.ai/v1/chat/completions. Add a custom model whose name is character-for-character a model id from https://aapi.ai/pricing, then select that model in Chat or Agent and send a short prompt. The sample id in this repository is `deepseek-v4.1-flash`. Confirm it on the pricing page, and substitute another listed id when the page has moved on. Cursor's help page describes bring-your-own API keys for chat models, and it states that Tab autocomplete stays on Cursor's built-in models: https://cursor.com/help/models-and-usage/api-keys. Cursor staff have also described the base-URL override as applying to OpenAI-family requests while the override is on, so turn the override off when you want Cursor-managed OpenAI models again. The forum thread is https://forum.cursor.com/t/how-to-use-a-custom-openai-compatible-api-in-cursor-setup-limits-and-tips/171497. Menu labels move between Cursor versions. The values that have to match are the base URL https://aapi.ai/v1, the AAPI key in the OpenAI API Key field, and a model id from the pricing page. A curl to the same URL with the same key and model id checks those three values before you debug the Cursor form. The copy-paste card with the same steps is https://github.com/cozcc/aapi/blob/main/docs/clients/cursor.md.

## Evidence

```text
Base URL: https://aapi.ai/v1
Key:      AAPI key, pasted into OpenAI API Key
Model:    an id from https://aapi.ai/pricing
```

- Cursor card: https://github.com/cozcc/aapi/blob/main/docs/clients/cursor.md
- Client index: https://github.com/cozcc/aapi/blob/main/docs/clients/README.md
- Cursor API keys help: https://cursor.com/help/models-and-usage/api-keys
- Override behavior (Cursor forum): https://forum.cursor.com/t/how-to-use-a-custom-openai-compatible-api-in-cursor-setup-limits-and-tips/171497
- Model ids: https://aapi.ai/pricing

中文: https://github.com/cozcc/aapi/blob/main/topics/use-aapi-in-cursor.zh-CN.md
