# AAPI 公开事实快照（方法）

上次更新：2026-11-08

本页是一份重复发布的公开快照的方法草稿，例如每周一次。填好的快照会列出公开的模型 id 和系列名称，链到官方价格，并且只在实际测量之后记录客户端延迟。2026-11-08 这一行是占位。数字待测量后填入（numbers filled when measured）。美元金额留在 https://aapi.ai/pricing，不写入本文件。

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

## 如何测量延迟

只有当一次运行遵守本协议并得出数字时，才公布延迟。在那之前，单元格文字是 `numbers filled when measured`（数字待测量后填入）。

- 调用 `POST https://aapi.ai/v1/chat/completions`，请求头为 `Authorization: Bearer`，密钥在 `AAPI_API_KEY`。公布的记录里不写密钥。
- 发送非流式 JSON：`temperature` 为 0，一条用户消息，内容为 `ping`，`model` 使用同一 UTC 日期从 https://aapi.ai/pricing 复制的 id。
- 总延迟是客户端墙上时钟，从请求开始到响应正文接收完毕，单位为毫秒。
- 流式的首字节时间是另一项指标。本方法记录的是非流式总延迟。
- 丢弃 1 次预热请求。然后连续发送 20 次。
- 记录样本数、中位数、第 95 百分位、HTTP 错误次数、用普通语言写的客户端所在地区，以及 UTC 日期。
- 失败次数计入尝试总数，并把错误次数写在延迟旁边。
- 在备注里写明客户端和地区。单次样本只是一次观察，公布的行使用上面的 20 次测量。

## 快照

| UTC 日期 | 模型 id | 系列 | 总延迟中位数 | 总延迟 p95 | 样本数 | 地区 | HTTP 错误 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-11-08 | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured | numbers filled when measured |

## 依据

- 官方价格与模型 id：https://aapi.ai/pricing
- 目录 JSON：https://aapi.ai/api/pricing
- 价格在哪里读：https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.zh-CN.md
- Chat Completions 地址：https://aapi.ai/v1/chat/completions

English: https://github.com/cozcc/aapi/blob/main/topics/primary-facts.md
