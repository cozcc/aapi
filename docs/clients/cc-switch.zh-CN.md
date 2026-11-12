# CC Switch

在 [CC Switch](https://github.com/farion1231/cc-switch) 里自定义填写 AAPI 的 Chat Completions Base URL。不要去给 CC Switch 加内置预设。

English: [cc-switch.md](./cc-switch.md)

CC Switch 贡献指南（自定义供应商与预设的区分）：https://github.com/farion1231/cc-switch/blob/main/CONTRIBUTING.md

添加供应商说明（2026-11-12 核对）：https://github.com/farion1231/cc-switch/blob/main/docs/user-manual/en/2-providers/2.1-add.md · https://ccswitch.io/en/docs?item=add&section=providers

## 卡片

```text
规范 Base URL: https://aapi.ai/v1
Key:           AAPI 密钥（即 AAPI_API_KEY 的值）
Model:         https://aapi.ai/pricing 上的 model_name
```

本仓库示例模型 id：`deepseek-v4.1-flash`。以定价页为准。

AAPI 不是 CC Switch 的内置预设（2026-11-12 对照贡献指南和添加供应商说明核对）。CC Switch 写明：没有赞助预设的中转或聚合服务，仍然可以通过「自定义供应商 / 自定义配置」使用。本页只说明这种自定义填写，不向 CC Switch 项目申请免费预设。

## 端点栏要填什么

最终必须成功的请求是 `POST https://aapi.ai/v1/chat/completions`。CC Switch 里具体填什么，取决于该栏位的用法：

- 若该栏是 OpenAI SDK 风格的 Base URL，客户端只会再拼 `/chat/completions`，则填 `https://aapi.ai/v1`。保留 `/v1`。不要在栏里加上 `/chat/completions`。
- 若该栏是前缀，CC Switch 会再拼 `/v1/chat/completions`，则填 `https://aapi.ai`（不要再写末尾的 `/v1`）。在这种前缀模式下填 `https://aapi.ai/v1`，请求会变成 `/v1/v1/chat/completions`。
- 添加供应商说明里，默认前缀的例子是 `https://api.example.com`，实际请求为 `https://api.example.com/v1/chat/completions`。同一份说明里，Codex 的 `config.toml` 例子则是已经以 `/v1` 结尾的 Base URL。按你正在编辑的那一栏来填，不要把同一种写法套到每一个应用上。
- 不要打开 **Full URL**（完整 URL）模式。那种模式用于非标准完整路径，而且要开本地路由。AAPI 已公布的是上面这条普通的 Chat Completions 地址。

## 适合这条 Chat Completions URL 的应用

1. 在你真正使用的那个应用里打开 **添加供应商**。
2. 第一步选 **自定义配置**（若是 OpenCode，也可以选它的 **OpenAI Compatible** 预设；这仍是自定义填端点，不是 AAPI 的内置预设）。
3. 把 AAPI 密钥粘贴到 API Key 栏。
4. 按上一节填写端点，使发出去的请求是 `POST https://aapi.ai/v1/chat/completions`。
5. 模型名称与 https://aapi.ai/pricing 上的实时 `model_name` 完全一致。

在 CC Switch 里给 **Hermes** 添加自定义供应商时，与本仓库的 Hermes 卡片一致：provider 为 `custom`，Base URL 为 `https://aapi.ai/v1`。见 [hermes-agent.zh-CN.md](./hermes-agent.zh-CN.md)。

**Codex**：CC Switch 自定义 Codex 的 `wire_api` 默认是 Responses。AAPI 已公布的是 Chat Completions，不是 Responses。自定义 Codex 卡片时，把上游格式设为 **Chat Completions**，并为 Codex 打开本地路由，这与添加供应商说明对 Chat Completions 上游的要求一致。`base_url` 要让转换后的请求仍然打到 `https://aapi.ai/v1/chat/completions`。

## 不要这样填

Claude Code 的 `ANTHROPIC_BASE_URL` 走 Anthropic Messages（`/v1/messages`）。本仓库不为 AAPI 公布该协议。不要把 `ANTHROPIC_BASE_URL` 设成 `https://aapi.ai` 或 `https://aapi.ai/v1`。请用上面的 Chat Completions 应用，或见 [claude-code.zh-CN.md](./claude-code.zh-CN.md)。

## 终端自检

```bash
curl https://aapi.ai/v1/chat/completions \
  -H "Authorization: Bearer $AAPI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-v4.1-flash",
    "messages": [{"role": "user", "content": "你好"}]
  }'
```

与 [`examples/curl.sh`](../../examples/curl.sh) 相同。这条成功说明密钥、Base URL 和模型 id 有效，再去看 CC Switch 的表单。不同版本的菜单文案会变；必须对齐的是最终的 Chat Completions URL、AAPI 密钥，以及定价页上的模型 id。
