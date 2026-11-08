# AAPI

**一把 Key，多模型，少折腾。**

AAPI 是 OpenAI 兼容的 API 网关：一个密钥接入多种模型，对外展示**官方标价**。

- 官网：https://aapi.ai
- 模型与定价：https://aapi.ai/pricing

> 本仓库只是**公开文档与示例入口**，**不包含**服务端源码、管理后台或内部基础设施。

---

## 快速开始

### 1. 获取 API Key

在 [aapi.ai](https://aapi.ai) 注册，并在控制台创建密钥。

### 2. Base URL

```text
https://aapi.ai/v1
```

把它填进 OpenAI SDK 的 `base_url` / `BASE_URL`。密钥请自行保管，不要提交到 Git。

### 3. Chat Completions（`curl`）

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

### 4. OpenAI Python SDK

```python
from openai import OpenAI

client = OpenAI(
    api_key="YOUR_AAPI_KEY",  # 替换；不要写进仓库
    base_url="https://aapi.ai/v1",
)

resp = client.chat.completions.create(
    model="deepseek-v4.1-flash",
    messages=[{"role": "user", "content": "你好"}],
)
print(resp.choices[0].message.content)
```

更多示例见 [`examples/`](./examples/)。

---

## 模型与定价

- 实时模型与**官方** USD/1M 标价：https://aapi.ai/pricing
- 公开定价 JSON（无需登录）：`GET https://aapi.ai/api/pricing`

模型列表可能变化；以定价页为准，不要依赖仓库里的缓存名单。

---

## 安全

见 [SECURITY.md](./SECURITY.md)。漏洞请私下报告；不要在公开 Issue 里贴利用细节、密钥或用户数据。

---

## 许可证

本仓库文档与示例采用 [MIT](./LICENSE)。
