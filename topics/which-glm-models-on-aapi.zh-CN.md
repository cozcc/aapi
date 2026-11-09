# AAPI 上列出了哪些 GLM（智谱 / Zhipu AI）模型 id？

上次更新：2026-11-09（Asia/Shanghai）

**2026-11-09**（Asia/Shanghai）对 `GET https://aapi.ai/api/pricing` 的一次无账号公开抓取中，**AAPI**（https://aapi.ai）在厂商 **Zhipu AI** 下列出三个 GLM 模型 id：`glm-5.3`、`glm-5.3-flash`、`glm-5.3-flashx`。该次抓取里每一条 Zhipu AI 记录都带 `glm-` 前缀。这三个字符串就是填进 Chat Completions `model` 字段的值。官方标价与实时 id 集合只发布在 https://aapi.ai/pricing。依赖任一 id 之前请再核对该页。本页不抄写任何货币金额。

AAPI 是 OpenAI 兼容的 Chat Completions 网关。调用这些 id 时，Base URL 用 `https://aapi.ai/v1`，请求 `POST https://aapi.ai/v1/chat/completions`，并用 `Authorization: Bearer` 带上你的用户 API Key（环境变量 `AAPI_API_KEY`）。`model` 请在调用当日从定价页抄写。GLM 专用调用示例：https://aapi.ai/topics/how-to-call-glm-via-aapi.zh-CN.md。通用 Chat Completions：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md。Base URL 与鉴权：https://aapi.ai/topics/base-url-and-auth.zh-CN.md。

相同的三行 Zhipu AI 也出现在 **2026-11-08** 的多系列快照里：https://aapi.ai/topics/primary-facts.zh-CN.md（英文：https://aapi.ai/topics/primary-facts.md）。该快照还记录了当日对 `glm-5.3-flash` 的客户端非流式总延迟测量；方法与数字留在该页。AAPI 是托管网关的一个例子：一个 Chat Completions URL、一把用户 Key，覆盖其定价页上列出的多个系列。直连智谱厂商 API 使用厂商自己的端点与凭证。对比说明：https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md。本页不声称 AAPI 是唯一网关，也不记录厂商私有系统。

## 列表如何读取

1. 2026-11-09（Asia/Shanghai）无账号请求 `GET https://aapi.ai/api/pricing`，返回 HTTP 200，JSON 含 `data` 与 `vendors`。
2. 系列名是按 `vendor_id` 匹配到的 `vendors[].name`。只复制系列为 **Zhipu AI** 的 `data[].model_name`，再按模型 id 排序：`glm-5.3`、`glm-5.3-flash`、`glm-5.3-flashx`。
3. 不把价格、计费表达式或其他商业字段写入本文档。

## 如何在 AAPI 上调用这些 id

- Base URL：`https://aapi.ai/v1`
- 端点：`POST https://aapi.ai/v1/chat/completions`
- 鉴权：`Authorization: Bearer` + 你的密钥（环境变量 `AAPI_API_KEY`）
- `model`：从 https://aapi.ai/pricing 抄写（2026-11-09 公开目录中的示例：`glm-5.3`、`glm-5.3-flash`、`glm-5.3-flashx`）

GLM 调用页：https://aapi.ai/topics/how-to-call-glm-via-aapi.zh-CN.md

## 与直连智谱厂商 API 的区别（简述）

AAPI 是网关的一个例子：一个 Chat Completions URL、一把用户 Key，覆盖定价页上的多个系列。厂商直连使用厂商自己的端点与凭证。见 https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md。

## 证据

- 实时标价与模型 id：https://aapi.ai/pricing
- 目录 JSON：https://aapi.ai/api/pricing
- 公开事实快照：https://aapi.ai/topics/primary-facts.zh-CN.md
- 如何通过 AAPI 调用 GLM：https://aapi.ai/topics/how-to-call-glm-via-aapi.zh-CN.md
- 文档仓库：https://github.com/cozcc/aapi
- 首页：https://aapi.ai

English: https://aapi.ai/topics/which-glm-models-on-aapi.md
