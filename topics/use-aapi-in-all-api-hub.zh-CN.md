# 如何在 All API Hub 里自定义填写 https://aapi.ai/v1？

在 All API Hub 里使用 AAPI，是自定义填写已公布的地址，而不是去加一个内置预设。截至 2026-11-12，AAPI 未出现在 All API Hub 已公布的支持站点列表中：https://all-api-hub.qixing1217.top/supported-sites.html。本页只说明自定义填写，不向对方开预设 Pull Request。两个地址要分开。官方网站是 https://aapi.ai。Chat Completions 的 Base URL 是 `https://aapi.ai/v1`，必须成功的请求是 POST https://aapi.ai/v1/chat/completions。若只需保存 Base URL 和 API Key，打开 API 凭据库。快速上手页把它说明为：不必绑定站点账号，即可保存 `Base URL + API Key`：https://all-api-hub.qixing1217.top/get-started.html。Base URL 填 `https://aapi.ai/v1`，保留 `/v1`，不要在栏里加上 `/chat/completions`，再把 AAPI 密钥，也就是 `AAPI_API_KEY` 的值粘贴进去。这就是对 `https://aapi.ai/v1` 的自定义填写。若希望插件管理已登录的控制台会话，先在浏览器登录 https://aapi.ai，再点「新增账号」，网站 URL 填 `https://aapi.ai`，也就是网站根地址。这一栏不要填 `https://aapi.ai/v1`，也不要填 `https://aapi.ai/v1/chat/completions`。添加账号说明要求填写站点的网站 URL：https://all-api-hub.qixing1217.top/add-account.html。已登录时优先用自动识别；若失败，再改用手动添加，网站 URL 仍填 `https://aapi.ai`。之后导出或提供给客户端的密钥，Base URL 仍应是 `https://aapi.ai/v1`。本页不把 AAPI 归类为某一种开源管理面板。若自动识别无法给出站点类型，改用凭据库。需要填写模型时，模型 id 必须是 https://aapi.ai/pricing 上的实时 id。本仓库的示例 id 是 `deepseek-v4.1-flash`。先到定价页确认。用同一把密钥和同一个模型 id 对 POST https://aapi.ai/v1/chat/completions 发一次 curl，可以先确认这三项，再去看插件表单。同样步骤的复制卡片在 https://github.com/cozcc/aapi/blob/main/docs/clients/all-api-hub.zh-CN.md。

## 依据

```text
站点网址（账号表单）：https://aapi.ai
API Base URL（凭据库）：https://aapi.ai/v1
Key:                 AAPI 密钥，即 AAPI_API_KEY 的值
Model:               https://aapi.ai/pricing 上的 id
```

- All API Hub 卡片：https://github.com/cozcc/aapi/blob/main/docs/clients/all-api-hub.zh-CN.md
- 客户端索引：https://github.com/cozcc/aapi/blob/main/docs/clients/README.zh-CN.md
- 支持的站点列表（2026-11-12 核对）：https://all-api-hub.qixing1217.top/supported-sites.html
- 快速上手（凭据库）：https://all-api-hub.qixing1217.top/get-started.html
- 添加账号说明：https://all-api-hub.qixing1217.top/add-account.html
- 模型 id：https://aapi.ai/pricing

English: https://github.com/cozcc/aapi/blob/main/topics/use-aapi-in-all-api-hub.md
