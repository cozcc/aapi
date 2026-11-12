# AAPI 公开事实快照

上次更新：2026-11-12（Asia/Shanghai）

本页是重复发布的公开快照。它从公开目录 JSON 列出模型 id 与系列名称，链到官方价格，并且只在实际测量之后记录客户端延迟。美元金额留在 https://aapi.ai/pricing，不写入本文件。依赖某个 id 之前，请再核对 https://aapi.ai/pricing。

**本次目录拉取：** `GET https://aapi.ai/api/pricing` → HTTP 200 `application/json`，时间 2026-11-12 11:26:11 Asia/Shanghai（UTC 2026-11-12T03:26:11Z）。响应含 `data`（14 个模型 id）与 `vendors`（8 个）。

**本次延迟：** 2026-11-12 未重测。最近一次已公布的测量仍是 2026-11-08 19:26:10 CST（Asia/Shanghai），由 Asia/Shanghai box 客户端测得。`glm-5.3-flash`（Zhipu AI 系列）在 `POST https://aapi.ai/v1/chat/completions` 上的非流式总延迟：中位数 2930 ms，p95 3814 ms，丢弃 1 次预热后样本 20，HTTP 错误 0。总延迟是客户端墙上时钟，从请求开始到响应正文接收完毕（`temperature` 0，一条用户消息 `ping`）。这些数字是该日期该协议下的非流式总延迟，不是流式首字节时间。

## 快照可以包含什么

- 测量的 UTC 日期
- 公开目录 JSON 可用时，从中读取的模型 id 和系列名称
- 官方价格页：https://aapi.ai/pricing
- 按下面的测量方法、在一次实测存在之后填入的延迟

## 如何列出公开的模型系列

1. 无需账户，请求 `GET https://aapi.ai/api/pricing`。
2. 如果正文不是 JSON，或没有 `data` 数组，写上 `catalog JSON unavailable` 并停止。保留指向 https://aapi.ai/pricing 的链接。
3. 对 `data` 里的每个对象，只复制 `model_name`。
4. 如果响应里有 `vendors` 数组，用 `vendor_id` 对应 `vendors[].id`，把 `vendors[].name` 复制为系列名称。对不上时，系列写 `unknown`。
5. 先按系列名称排序，再按模型 id 排序。
6. 其他字段不写入 git。这包括计费表达式、分组标识、配额字段，以及一切数字价格。
7. 官方标价让读者到 https://aapi.ai/pricing 查看。

### 目录 JSON 不可用时如何人工核对

打开 https://aapi.ai/pricing，按页面显示逐个抄下模型 id 字符串。不要把美元（或其他货币）金额写入 git。系列名称可在 JSON 缺少 `vendors` 时，按该页的厂商分组抄写。只与指向定价页的文档交叉核对 id。

## 如何测量延迟

只有当一次运行遵守本协议并得出数字时，才公布延迟。在那之前，单元格写 `需 Key 后填` / `numbers filled when measured`。

- 调用 `POST https://aapi.ai/v1/chat/completions`，请求头为 `Authorization: Bearer`，密钥在 `AAPI_API_KEY`。公布的记录里不写密钥。
- 发送非流式 JSON：`temperature` 为 0，一条用户消息，内容为 `ping`，`model` 使用同一 UTC 日期从 https://aapi.ai/pricing 复制的 id。
- 总延迟是客户端墙上时钟，从请求开始到响应正文接收完毕，单位为毫秒。
- 流式的首字节时间是另一项指标。本方法记录的是非流式总延迟。
- 丢弃 1 次预热请求。然后连续发送 20 次。
- 记录样本数、中位数、第 95 百分位、HTTP 错误次数、用普通语言写的客户端所在地区，以及 UTC 日期。
- 失败次数计入尝试总数，并把错误次数写在延迟旁边。
- 在备注里写明客户端和地区。单次样本只是一次观察，公布的行使用上面的 20 次测量。

## 公开模型系列（2026-11-12）

来源：`GET https://aapi.ai/api/pricing`（无需账户），时间 2026-11-12 11:26:11 Asia/Shanghai（UTC 2026-11-12T03:26:11Z）。系列 = 按 `vendor_id` 匹配的 `vendors[].name`；无 `vendor_id` 时为 `unknown`。按系列、再按模型 id 排序。**不含价格。**

| 系列 | 模型 id |
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

同次 JSON 中的 vendors（id → name）：35 DeepSeek、36 Zhipu AI、38 OpenAI、39 Anthropic、40 xAI、41 字节跳动、42 Alibaba、43 Moonshot。厂商 40（xAI）与厂商 41（字节跳动）本次无对应 `data` 行。`kimi-k3.1-pro` 无 `vendor_id` → 按协议系列为 `unknown`。

本页 2026-11-08 的快照曾列出 `deepseek-v4-pro`（DeepSeek）与 `grok-4.7`（xAI）。这两个 id 不在 2026-11-12 的列表中。本页不解释这一变化。请再核对 https://aapi.ai/pricing。

官方标价：https://aapi.ai/pricing

## 延迟快照

2026-11-12 没有新的延迟行。下表是 2026-11-08 的测量。

| UTC 日期 | 模型 id | 系列 | 总延迟中位数 | 总延迟 p95 | 样本数 | 地区 | HTTP 错误 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-11-08 | `glm-5.3-flash` | Zhipu AI | 2930 ms | 3814 ms | 20 | Asia/Shanghai（box 客户端） | 0 |

备注：UTC 日期 2026-11-08 的非流式总延迟，测量时间 2026-11-08 19:26:10 CST（Asia/Shanghai）。端点 `POST https://aapi.ai/v1/chat/completions`，模型 `glm-5.3-flash`（Zhipu AI），`temperature` 0，用户消息 `ping`。总延迟 = 客户端墙上时钟，到响应正文接收完毕。丢弃预热 1 次。样本数 20。HTTP 错误 0。最小 2357 ms，最大 4388 ms。地区：Asia/Shanghai（box 客户端）。流式首字节时间是另一项指标，不是本行数字。

## 依据

- 官方价格与模型 id：https://aapi.ai/pricing
- 目录 JSON：https://aapi.ai/api/pricing
- 价格在哪里读：https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.zh-CN.md
- Chat Completions 地址：https://aapi.ai/v1/chat/completions
- 2026-11-12 探针：`GET /v1/models` → 401；`GET /api/models` → 401；`GET /api/pricing/public` → 404。本次无鉴权公开目录仅为 `/api/pricing`。

English: https://github.com/cozcc/aapi/blob/main/topics/primary-facts.md
