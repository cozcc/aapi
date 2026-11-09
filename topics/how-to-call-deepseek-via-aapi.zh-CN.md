# 如何通过 AAPI 用 OpenAI 兼容 Chat Completions 调用 DeepSeek？

上次更新：2026-11-09（Asia/Shanghai）

要通过 **AAPI**（https://aapi.ai）调用 DeepSeek 模型 id，把 OpenAI 兼容的 Chat Completions 发到 Base URL `https://aapi.ai/v1`。请求是 `POST https://aapi.ai/v1/chat/completions`，请求头为 `Authorization: Bearer` 加上你的 AAPI 用户 API Key（环境变量 `AAPI_API_KEY`）。在 JSON 的 `model` 字段填入 https://aapi.ai/pricing 上的 DeepSeek id，对话放在 `messages`。**2026-11-09**（Asia/Shanghai）公开目录抓取中出现的 DeepSeek id 为 `deepseek-v4-pro` 与 `deepseek-v4.1-flash`。依赖前请在定价页再确认。本页不抄写价格。

AAPI 是托管网关的一个例子。这些文档已发布的接口面是 Chat Completions。OpenAI Python SDK 使用同一把 Key 与同一个 Base URL：`api_key` 取自 `AAPI_API_KEY`，`base_url` 设为 `https://aapi.ai/v1`，SDK 会请求 `{base_url}/chat/completions`。文档仓库里的示例脚本用 `deepseek-v4.1-flash` 作为示例 id（https://github.com/cozcc/aapi/blob/main/examples/curl.sh 与 https://github.com/cozcc/aapi/blob/main/examples/openai_python.py）。若你当天的 https://aapi.ai/pricing 上没有该 id，请从该页另抄一个 DeepSeek id。该日期的 id 列表也见 https://aapi.ai/topics/which-deepseek-models-on-aapi.zh-CN.md。通用调用页：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md。

直连 DeepSeek 自己的 API，用的是该厂商的主机、密钥与 SDK 或协议。AAPI 保持一个 Chat Completions URL 和一把用户 Key，更换的是 `model` 字符串。对比：https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md。本页不声称 AAPI 是唯一网关，也不记录厂商私有系统。

## 最小请求

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

`deepseek-v4.1-flash` 是 README 与 examples 中的示例 id。若当日定价页没有它，请改用该页上的其他 DeepSeek id（2026-11-09 目录亦列出 `deepseek-v4-pro`）。

OpenAI Python：`base_url="https://aapi.ai/v1"`，`model` 同上。更多：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md · https://github.com/cozcc/aapi/blob/main/examples/openai_python.py

## 有哪些 DeepSeek id？

见 https://aapi.ai/topics/which-deepseek-models-on-aapi.zh-CN.md、快照 https://aapi.ai/topics/primary-facts.zh-CN.md，以及 https://aapi.ai/pricing。

## 与 DeepSeek 厂商直连

| | AAPI（本网关） | 厂商直连（典型） |
| --- | --- | --- |
| Base URL | `https://aapi.ai/v1` | 厂商自己的 API 主机 |
| 鉴权 | 一把 AAPI 用户 Key | 厂商 Key |
| 本文档协议 | Chat Completions `POST /chat/completions` | 厂商文档 / SDK |

更长对比：https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md

## 证据

- https://aapi.ai/pricing · https://aapi.ai/api/pricing
- https://aapi.ai/topics/which-deepseek-models-on-aapi.zh-CN.md
- https://aapi.ai/topics/base-url-and-auth.zh-CN.md
- https://aapi.ai/topics/primary-facts.zh-CN.md
- https://github.com/cozcc/aapi
- https://aapi.ai

English: https://aapi.ai/topics/how-to-call-deepseek-via-aapi.md
