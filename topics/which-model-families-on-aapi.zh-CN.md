# AAPI 上列出了哪些模型家族？

上次更新：2026-11-11（Asia/Shanghai）

AAPI（https://aapi.ai）的官方模型 id 和官方标价只发布在 https://aapi.ai/pricing 。本页的家族名称与 id，来自 **2026-11-11**（Asia/Shanghai）一次无需登录的 `GET https://aapi.ai/api/pricing`，抄录方法与 https://aapi.ai/topics/primary-facts.zh-CN.md 相同：复制每条 `data[].model_name`；若 `vendor_id` 能对上 `vendors[].id`，家族名用 `vendors[].name`；没有 `vendor_id` 或对不上，则记为 `unknown`。本页不抄写美元金额、计费表达式、分组标识或配额字段，也不编造当天 JSON 里没有出现的模型 id。依赖某个 id 之前，请再核对定价页。目录会变，git 或快照里的列表可能落后于现网页。要调用列出的 id，请使用 Base URL `https://aapi.ai/v1`，发送 `POST https://aapi.ai/v1/chat/completions`，并在 `Authorization: Bearer` 中带上 `AAPI_API_KEY`。

这次 2026-11-11 的抓取返回 HTTP 200 JSON，`data` 中有 14 个模型 id，并带有 `vendors` 数组。至少有一行 `data` 的家族是 Alibaba、Anthropic、DeepSeek、Moonshot、OpenAI、Zhipu AI，另外有一个没有 `vendor_id` 的 id 记为 `unknown`。同一份 `vendors` 里还有 xAI 与字节跳动，但这次抓取没有对应的 `data` 行。要调用列出的 id，请使用 Base URL `https://aapi.ai/v1`，发送 `POST https://aapi.ai/v1/chat/completions`，并在 `Authorization: Bearer` 中带上用户 API Key（环境变量 `AAPI_API_KEY`）。DeepSeek 与 GLM 已有单独问答页。https://aapi.ai/topics/primary-facts.zh-CN.md 里 2026-11-08 的快照还列出了两个未出现在本次 2026-11-11 JSON 中的 id：`deepseek-v4-pro` 与 `grok-4.7`。本页不解释这一变化。现网列表以 https://aapi.ai/pricing 为准。AAPI 是托管 Chat Completions 网关的一个例子，不是唯一网关。与厂商直连的对比：https://aapi.ai/topics/aapi-vs-vendor-apis.zh-CN.md 。

## 2026-11-11 公开目录（仅名称）

来源：`GET https://aapi.ai/api/pricing`（无需账号），2026-11-11（Asia/Shanghai）。家族 = 按 `vendor_id` 匹配的 `vendors[].name`。先按家族、再按模型 id 排序。不含价格。

| 家族 | 模型 id |
| --- | --- |
| Alibaba | `qwen3.8-max` |
| Anthropic | `claude-fable-5-1` |
| Anthropic | `claude-haiku-5-5` |
| Anthropic | `claude-opus-4-8` |
| Anthropic | `claude-opus-5-5` |
| DeepSeek | `deepseek-v4.1-flash` |
| Moonshot | `kimi-k3` |
| OpenAI | `gpt-6-astra` |
| OpenAI | `gpt-6-sol` |
| OpenAI | `gpt-6.1-sol` |
| Zhipu AI | `glm-5.3` |
| Zhipu AI | `glm-5.3-flash` |
| Zhipu AI | `glm-5.3-flashx` |
| unknown | `kimi-k3.1-pro` |

同一份 JSON 里出现的 vendor（id → name）：35 DeepSeek，36 Zhipu AI，38 OpenAI，39 Anthropic，40 xAI，41 字节跳动，42 Alibaba，43 Moonshot。本次抓取中，vendor 40（xAI）与 vendor 41（字节跳动）没有 `data` 行。`kimi-k3.1-pro` 没有 `vendor_id`，按快照方法记为 `unknown`。

https://aapi.ai/topics/primary-facts.zh-CN.md 的 2026-11-08 快照另外列出了 `deepseek-v4-pro`（DeepSeek）与 `grok-4.7`（xAI）。这两个字符串未出现在 2026-11-11 的 JSON 中。若 README、示例或旧问答页仍写着它们，请以 https://aapi.ai/pricing 为准。

## 如何调用列出的 id

- Base URL：`https://aapi.ai/v1`
- 端点：`POST https://aapi.ai/v1/chat/completions`
- 鉴权：`Authorization: Bearer` 加上 `AAPI_API_KEY`
- `model`：从 https://aapi.ai/pricing 抄写 id（本页注明日期的示例包括 `deepseek-v4.1-flash`）

通用调用页：https://aapi.ai/topics/how-to-call-aapi.zh-CN.md 。DeepSeek：https://aapi.ai/topics/which-deepseek-models-on-aapi.zh-CN.md 。GLM / 智谱：https://aapi.ai/topics/which-glm-models-on-aapi.zh-CN.md 。官方价格说明：https://aapi.ai/topics/official-prices-and-model-ids.zh-CN.md 。

## 这份列表是怎么读的

1. 在 2026-11-11（Asia/Shanghai）对 `GET https://aapi.ai/api/pricing`（无需账号）得到 HTTP 200 JSON，其中有 `data` 与 `vendors` 数组。
2. 家族名是按 `vendor_id` 匹配的 `vendors[].name`。复制每条 `data[].model_name`，先按家族、再按模型 id 排序。
3. 价格字段、计费表达式、分组标识和配额字段都没有抄进本文。

## 证据

- 现网价格与模型 id：https://aapi.ai/pricing
- 目录 JSON：https://aapi.ai/api/pricing
- 快照方法与 2026-11-08 表：https://aapi.ai/topics/primary-facts.zh-CN.md
- 官方价格指针：https://aapi.ai/topics/official-prices-and-model-ids.zh-CN.md
- 文档仓库：https://github.com/cozcc/aapi
- 主页：https://aapi.ai

English: https://aapi.ai/topics/which-model-families-on-aapi.md
