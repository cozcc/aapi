# 如何在 CC Switch 里自定义填写 https://aapi.ai/v1？

在 CC Switch 里使用 AAPI，是自定义填写 Chat Completions 的 Base URL，而不是去加一个内置预设。截至 2026-11-12，AAPI 不是 CC Switch 的预设。CC Switch 的贡献指南写明：没有赞助预设的中转或聚合服务，仍然可以通过自定义供应商 / 自定义配置使用：https://github.com/farion1231/cc-switch/blob/main/CONTRIBUTING.md。本页走这条路径，不向对方仓库开预设 Pull Request。AAPI 已公布的地址是 `https://aapi.ai/v1`，必须成功的请求是 POST https://aapi.ai/v1/chat/completions。在 CC Switch 里，打开你真正使用的那个应用的「添加供应商」，选择自定义配置；若是 OpenCode，也可以选它的 OpenAI Compatible 预设，那仍是自定义填端点。把 AAPI 密钥，也就是 `AAPI_API_KEY` 的值，粘贴到 API Key 栏。端点栏要填什么，取决于该栏位的用法。若该栏是 OpenAI SDK 风格的 Base URL，客户端只会再拼 `/chat/completions`，则填 `https://aapi.ai/v1`，保留 `/v1`，不要在栏里加上 `/chat/completions`。若该栏是前缀，CC Switch 会再拼 `/v1/chat/completions`，则填 `https://aapi.ai`，不要再写末尾的 `/v1`，否则请求会变成 `/v1/v1/chat/completions`。添加供应商说明里，默认前缀的例子是 `https://api.example.com` 这类主机名；同一份说明里，Codex 的 `config.toml` 例子则已经以 `/v1` 结尾：https://github.com/farion1231/cc-switch/blob/main/docs/user-manual/en/2-providers/2.1-add.md。按你正在编辑的那一栏来填。不要打开 Full URL 模式。在 CC Switch 里给 Hermes 添加自定义供应商时，与本仓库的 Hermes 卡片一致：provider 为 `custom`，Base URL 为 `https://aapi.ai/v1`。自定义 Codex 卡片不要保留默认的 Responses 线路，因为 AAPI 已公布的是 Chat Completions；把上游格式设为 Chat Completions，并为 Codex 打开本地路由。不要把 Claude Code 的 `ANTHROPIC_BASE_URL` 设成 `https://aapi.ai` 或 `https://aapi.ai/v1`，因为该变量走 Anthropic Messages（`/v1/messages`），本仓库不为 AAPI 公布该协议。模型名称必须是 https://aapi.ai/pricing 上的实时 id。本仓库的示例 id 是 `deepseek-v4.1-flash`。先到定价页确认。用同一把密钥和同一个模型 id 对 POST https://aapi.ai/v1/chat/completions 发一次 curl，可以先确认这三项，再去看 CC Switch 的表单。同样步骤的复制卡片在 https://github.com/cozcc/aapi/blob/main/docs/clients/cc-switch.zh-CN.md。

## 依据

```text
规范 Base URL: https://aapi.ai/v1
Key:           AAPI 密钥，即 AAPI_API_KEY 的值
Model:         https://aapi.ai/pricing 上的 id
```

- CC Switch 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/cc-switch.zh-CN.md
- 客户端索引：https://github.com/cozcc/aapi/blob/main/docs/clients/README.zh-CN.md
- CC Switch 贡献指南（自定义与预设）：https://github.com/farion1231/cc-switch/blob/main/CONTRIBUTING.md
- 添加供应商说明（2026-11-12 核对）：https://github.com/farion1231/cc-switch/blob/main/docs/user-manual/en/2-providers/2.1-add.md
- 模型 id：https://aapi.ai/pricing
- Claude Code 说明：https://github.com/cozcc/aapi/blob/main/topics/claude-code-and-anthropic-messages.zh-CN.md

English: https://github.com/cozcc/aapi/blob/main/topics/use-aapi-in-cc-switch.md
