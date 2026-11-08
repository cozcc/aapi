# OpenAI Python

用 OpenAI 官方 Python SDK 指向 AAPI Base URL。

English: [openai-python.md](./openai-python.md)

## 卡片

```text
Base URL: https://aapi.ai/v1
Key 环境变量: AAPI_API_KEY
SDK 环境变量: OPENAI_API_KEY=$AAPI_API_KEY
              OPENAI_BASE_URL=https://aapi.ai/v1
Model:    https://aapi.ai/pricing 上的 model_name
```

## 显式构造（本仓库示例）

[`examples/openai_python.py`](../../examples/openai_python.py)：

```python
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.environ["AAPI_API_KEY"],
    base_url=os.environ.get("AAPI_BASE_URL", "https://aapi.ai/v1"),
)

resp = client.chat.completions.create(
    model="deepseek-v4.1-flash",  # 以 https://aapi.ai/pricing 为准
    messages=[{"role": "user", "content": "ping"}],
)
print(resp.choices[0].message.content)
```

```bash
export AAPI_API_KEY="your-key"   # 不要提交
python examples/openai_python.py
```

## SDK 默认环境变量

无参 `OpenAI()` 读取 `OPENAI_API_KEY` 和 `OPENAI_BASE_URL`：

```bash
export OPENAI_API_KEY="$AAPI_API_KEY"
export OPENAI_BASE_URL="https://aapi.ai/v1"
```

```python
from openai import OpenAI

client = OpenAI()
resp = client.chat.completions.create(
    model="deepseek-v4.1-flash",  # 以 https://aapi.ai/pricing 为准
    messages=[{"role": "user", "content": "ping"}],
)
print(resp.choices[0].message.content)
```

两种写法都请求 `POST https://aapi.ai/v1/chat/completions`。模型 id 以 https://aapi.ai/pricing 为准。
