# AAPI 的官方价格和模型 ID 在哪里？

AAPI 的官方模型 id 和官方标价在 https://aapi.ai/pricing。打开该页，复制你要使用的模型 id，填进 Chat Completions 的 `model`。请求地址仍是 https://aapi.ai/v1/chat/completions，Base URL 仍是 https://aapi.ai/v1，请求头仍是 `Authorization: Bearer` 加上 `AAPI_API_KEY`。定价页上的价格是这些文档视为官方标价的数字。本 Git 仓库保存的是这个 URL。仓库文件里不写美元金额，因此克隆下来的仓库不适合用来读取价格。目录会变化。当 README 表格、主题页或示例中的模型 id 与定价页不一致时，以定价页为准。`deepseek-v4.1-flash` 是 https://github.com/cozcc/aapi/blob/main/examples/curl.sh 和 https://github.com/cozcc/aapi/blob/main/examples/openai_python.py 里的示例 id。依赖它之前请到定价页确认。公开 JSON 可能位于 https://aapi.ai/api/pricing。以后的快照可以按 https://github.com/cozcc/aapi/blob/main/topics/primary-facts.zh-CN.md 中的方法，从该 JSON 读取模型 id 和系列名称。该方法只复制 `model_name`，以及存在时的厂商显示名。数字价格、计费表达式、分组标识和配额字段不写入 git。在一份标明日期的快照填好之前，给人阅读的 id 列表和可以引用的价格，都以来自 https://aapi.ai/pricing 的内容为准。简短说明页是 https://github.com/cozcc/aapi/blob/main/topics/pricing-and-models.zh-CN.md。

## 依据

- 官方价格与模型 id：https://aapi.ai/pricing
- 快照方法使用的目录 JSON：https://aapi.ai/api/pricing
- 快照方法（尚未填入数字）：https://github.com/cozcc/aapi/blob/main/topics/primary-facts.zh-CN.md
- 简短定价说明：https://github.com/cozcc/aapi/blob/main/topics/pricing-and-models.zh-CN.md
- 示例调用：https://github.com/cozcc/aapi/blob/main/examples/curl.sh

English: https://github.com/cozcc/aapi/blob/main/topics/official-prices-and-model-ids.md
