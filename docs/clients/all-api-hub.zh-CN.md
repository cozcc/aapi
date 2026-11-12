# All API Hub

在 [All API Hub](https://all-api-hub.qixing1217.top/get-started.html) 里自定义填写 AAPI 的站点地址和 Chat Completions Base URL。不要去给 All API Hub 加内置预设。

English: [all-api-hub.md](./all-api-hub.md)

支持的站点列表（2026-11-12 核对）：https://all-api-hub.qixing1217.top/supported-sites.html

添加账号说明：https://all-api-hub.qixing1217.top/add-account.html

## 卡片

```text
站点网址（账号表单）：https://aapi.ai
API Base URL（凭据库）：https://aapi.ai/v1
Key:                 AAPI 密钥（即 AAPI_API_KEY 的值）
Model:               https://aapi.ai/pricing 上的 model_name
```

本仓库示例模型 id：`deepseek-v4.1-flash`。以定价页为准。

在 https://aapi.ai 创建密钥。AAPI 未出现在 All API Hub 已公布的支持站点列表中（2026-11-12 核对）。本页只说明在插件里自定义填写，不向 All API Hub 申请免费预设。

这两个地址要分开。账号表单填的是网站根地址。API 凭据库填的是带 `/v1` 的 Chat Completions Base URL。两个栏都不要加上 `/chat/completions`。

## API 凭据库（直接填写 Base URL）

已经有 AAPI 密钥、只需要保存 `Base URL + API Key` 以便复制、测连接或导出时，用这一条。

1. 打开 All API Hub，进入 **API 凭据库**。快速上手页把它说明为：不必绑定站点账号，即可保存 `Base URL + API Key`：https://all-api-hub.qixing1217.top/get-started.html
2. Base URL 填 `https://aapi.ai/v1`。保留 `/v1`。不要加上 `/chat/completions`，路径由客户端自己拼接。
3. 粘贴 AAPI 密钥。
4. 若插件提供连接测试或模型列表，模型 id 以 https://aapi.ai/pricing 为准。本仓库的示例 id 是 `deepseek-v4.1-flash`。

这就是对 `https://aapi.ai/v1` 的自定义填写。

## 添加站点账号（填网站根地址，不要填 `/v1`）

若希望 All API Hub 管理已登录的控制台会话（余额、令牌或导出），而不只是保存原始 Base URL，用这一条。

1. 在浏览器中打开并登录 https://aapi.ai。
2. 打开 All API Hub，点击 **新增账号**。
3. 网站 URL 填 `https://aapi.ai`。这是网站根地址。这一栏不要填 `https://aapi.ai/v1`，也不要填 `https://aapi.ai/v1/chat/completions`。All API Hub 的添加账号说明要求填写站点的网站 URL：https://all-api-hub.qixing1217.top/add-account.html
4. 已登录时优先用 **自动识别**。若失败，再改用 **手动添加**，网站 URL 仍填 `https://aapi.ai`。
5. 账号保存之后，导出或提供给客户端使用的 API 配置，Base URL 仍应是 `https://aapi.ai/v1`。

本页不把 AAPI 归类为某一种开源管理面板。若自动识别无法给出站点类型，改用上面的凭据库。那条路径只需要已公布的 Chat Completions Base URL 和密钥。

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

与 [`examples/curl.sh`](../../examples/curl.sh) 相同。这条成功说明密钥、Base URL 和模型 id 有效，再去看插件表单。
