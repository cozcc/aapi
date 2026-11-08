# 上线前审核清单（本文件推公网前请删除，勿纳入公开仓）

## 已刻意排除
- [x] 无 oxo-api / New API 源码
- [x] 无管理后台路径、渠道、货源、GroupRatio
- [x] 无真实 Key / 内网地址 / Hermes / 服务器信息
- [x] 不粘贴完整 billing_expr / 内部计价公式正文（只链定价页）
- [x] 站点只推广 https://aapi.ai（示例 Base URL 用 https://aapi.ai/v1）

## 待 vv 确认
- [ ] 仓库名：`cozcc/aapi` 是否 OK
- [ ] 可见性：先 private 审核再转 public，或直接 public
- [ ] SECURITY 联系方式：是否要加专用邮箱（当前写官网联系）
- [ ] 官网首页展示的 BASE_URL 仍是 `https://api.oxoapi.com/v1`；公开文档是否统一写成 `https://aapi.ai/v1`（两边 /v1 目前均可鉴权）
- [ ] 模型名表是否保留（可能过时；已注明以定价页为准）

## AI / 滥用面
- [x] 无教人扫后台、无 OpenAPI 全量泄露
- [x] SECURITY 要求漏洞私下报、禁止公开 exploit
- [x] 示例强制环境变量，提供 .gitignore
