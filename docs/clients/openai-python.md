# OpenAI Python

Official OpenAI Python SDK against the AAPI base URL.

中文：[openai-python.zh-CN.md](./openai-python.zh-CN.md)

## Card

```text
Base URL: https://aapi.ai/v1
Key env:  AAPI_API_KEY
SDK env:  OPENAI_API_KEY=$AAPI_API_KEY
          OPENAI_BASE_URL=https://aapi.ai/v1
Model:    a model_name from https://aapi.ai/pricing
```

## Explicit constructor (this repo's example)

[`examples/openai_python.py`](../../examples/openai_python.py):

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

Both patterns send `POST https://aapi.ai/v1/chat/completions`. The model id is `data[].model_name` from `GET https://aapi.ai/api/pricing`.
