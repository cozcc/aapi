# 如何把已有的 OpenAI SDK 应用切到 AAPI？

上次更新：2026-11-11（Asia/Shanghai）

如果应用已经在用官方 OpenAI Python SDK 调用 OpenAI 自己的 API，要改走 AAPI（https://aapi.ai），请保留 Chat Completions 调用，只改主机和密钥。把客户端构造成 `OpenAI(api_key=..., base_url="https://aapi.ai/v1")`，并把 `api_key` 设成你的 AAPI 用户 API Key（环境变量 `AAPI_API_KEY`）。SDK 会请求 `{base_url}/chat/completions`，也就是 `POST https://aapi.ai/v1/chat/completions`。Base URL 要保留 `/v1`，不要把 `/chat/completions` 写进 Base URL。`model` 参数请填写从 https://aapi.ai/pricing 抄来的 AAPI 模型 id，不要假定 OpenAI 的模型 id 一定出现在 AAPI 上。若还没有密钥，请先在 https://aapi.ai 创建。文档仓库的示例是 `deepseek-v4.1-flash`。调用当天请到定价页确认，或改用仍在列表中的 id。官方标价只看定价页，本页不抄写价格。

如果客户端是无参构造的 `OpenAI()`，SDK 会读取 `OPENAI_API_KEY` 和 `OPENAI_BASE_URL`。这时把 `OPENAI_API_KEY` 设成同一把 AAPI 密钥，并设置 `OPENAI_BASE_URL=https://aapi.ai/v1`。仓库模板里的 `AAPI_BASE_URL` 同样是 `https://aapi.ai/v1`：https://github.com/cozcc/aapi/blob/main/.env.example 。两种写法都写在 https://github.com/cozcc/aapi/blob/main/docs/clients/openai-python.zh-CN.md 与 https://github.com/cozcc/aapi/blob/main/examples/openai_python.py 。鉴权仍然是 `Authorization: Bearer` 加上 AAPI 密钥。请先在 https://aapi.ai 控制台创建密钥，步骤见 https://aapi.ai/topics/get-an-api-key.zh-CN.md 。这是 Chat Completions 客户端的 Base URL 与密钥更换，不是协议翻译。只会发 Anthropic Messages（`ANTHROPIC_BASE_URL`、`/v1/messages`）的工具不能按这一页切换：https://aapi.ai/topics/claude-code-and-anthropic-messages.zh-CN.md 。AAPI 是托管网关的一个例子，不是唯一的 OpenAI 兼容网关。与厂商直连的对比：https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md 。通用调用页：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md 。

## 显式构造

仓库示例 https://github.com/cozcc/aapi/blob/main/examples/openai_python.py ：

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

两种写法都请求 `POST https://aapi.ai/v1/chat/completions`。

## 哪些不变，哪些要改

| | 典型的 OpenAI 直连 SDK 设置 | 改到 AAPI 之后 |
| --- | --- | --- |
| 客户端 | 官方 OpenAI Python SDK | 同一个 SDK |
| `base_url` | 该厂商默认或文档中的主机 | `https://aapi.ai/v1` |
| `api_key` / `OPENAI_API_KEY` | OpenAI 密钥 | AAPI 用户密钥（`AAPI_API_KEY`） |
| 请求 | `chat.completions.create` | 同一调用 |
| `model` | 该厂商文档中的 id | https://aapi.ai/pricing 上的 id |

## 本页做不到的事

这些文档只发布 Chat Completions。把 `ANTHROPIC_BASE_URL` 设成 `https://aapi.ai` 或 `https://aapi.ai/v1`，不是这里说的迁移。官方价格只看 https://aapi.ai/pricing 。

## 证据

- OpenAI Python 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/openai-python.zh-CN.md
- 示例脚本：https://github.com/cozcc/aapi/blob/main/examples/openai_python.py
- 环境变量模板：https://github.com/cozcc/aapi/blob/main/.env.example
- 如何调用：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md
- Base URL 与鉴权：https://aapi.ai/topics/base-url-and-auth.zh-CN.md
- 如何获取 Key：https://aapi.ai/topics/get-an-api-key.zh-CN.md
- 模型 id：https://aapi.ai/pricing

English: https://aapi.ai/topics/how-to-switch-openai-sdk-to-aapi.md
