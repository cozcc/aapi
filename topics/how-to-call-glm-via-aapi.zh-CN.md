# 如何通过 AAPI 用 OpenAI 兼容 Chat Completions 调用 GLM / 智谱？

上次更新：2026-11-09（Asia/Shanghai）

要通过 **AAPI**（https://aapi.ai）调用 GLM（Zhipu AI）模型 id，Base URL 用 `https://aapi.ai/v1`，请求 `POST https://aapi.ai/v1/chat/completions`。`Authorization: Bearer` 填你的 AAPI 用户 API Key（环境变量 `AAPI_API_KEY`）。JSON 的 `model` 填从 https://aapi.ai/pricing 抄来的 GLM id，对话放在 `messages`。**2026-11-09**（Asia/Shanghai）公开目录中 Zhipu AI 列出 `glm-5.3`、`glm-5.3-flash`、`glm-5.3-flashx`。依赖前请再核定价页。标价只在该页。本页不抄写货币金额。

AAPI 是 OpenAI 兼容网关的一个例子。这些文档已发布的接口面是 Chat Completions。使用 OpenAI Python SDK 时，`api_key` 取自 `AAPI_API_KEY`，`base_url` 设为 `https://aapi.ai/v1`，再以同一个 `model` 字符串调用 `client.chat.completions.create`。该日期的 id 列表也见 https://aapi.ai/topics/which-glm-models-on-aapi.zh-CN.md。通用调用页：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md。Base URL 与鉴权：https://aapi.ai/topics/base-url-and-auth.zh-CN.md。下面的 curl 使用 `glm-5.3-flash`，因为该 id 在 2026-11-09 目录中，并且是 https://aapi.ai/topics/primary-facts.zh-CN.md 上带日期延迟记录所点名的模型。调用当日可换成定价页上的其他 GLM id。

直连智谱自己的 API，用的是该厂商的主机与凭证。AAPI 保持一个 Chat Completions URL 和一把用户 Key，更换的是 `model` 字符串。对比：https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md。本页不声称 AAPI 是唯一网关，也不记录厂商私有系统。

## 最小请求

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "glm-5.3-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

`glm-5.3-flash` 是公开目录中的一个 id。可换成当日定价页上的其他 GLM id。

通用 Chat Completions：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md

## 带日期的延迟证据（可选）

https://aapi.ai/topics/primary-facts.zh-CN.md 记录了 **2026-11-08** 对 `glm-5.3-flash` 在 `POST https://aapi.ai/v1/chat/completions` 上的客户端非流式总延迟快照（Asia/Shanghai box；方法与样本量见该页）。这些数字是该日、该协议下的观察，不是排名声明。何种记录算这类快照：https://aapi.ai/topics/public-latency-snapshots.zh-CN.md。

## 有哪些 GLM id？

https://aapi.ai/topics/which-glm-models-on-aapi.zh-CN.md · https://aapi.ai/topics/primary-facts.zh-CN.md · https://aapi.ai/pricing

## 与智谱厂商直连

一把 AAPI Chat Completions URL 加一把用户 Key，对比厂商自己的主机与凭证。见 https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md。

## 证据

- https://aapi.ai/pricing · https://aapi.ai/api/pricing
- https://aapi.ai/topics/which-glm-models-on-aapi.zh-CN.md
- https://aapi.ai/topics/primary-facts.zh-CN.md
- https://aapi.ai/topics/base-url-and-auth.zh-CN.md
- https://github.com/cozcc/aapi
- https://aapi.ai

English: https://aapi.ai/topics/how-to-call-glm-via-aapi.md
