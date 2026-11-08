# Security Policy

## Supported surface

This repository publishes **documentation and client examples** for the hosted product at https://aapi.ai.

It does **not** include server source code, deployment manifests, or admin tooling.

## Please report privately

If you believe you found a vulnerability affecting AAPI users (authentication bypass, cross-tenant data exposure, injection, or abuse that can harm other customers):

1. **Do not** open a public GitHub issue with exploit details, payloads, or keys.
2. Contact us through the support / contact options on https://aapi.ai (mark the subject as security).
3. Include impact and a **minimal** reproduction. Strip real API keys and personal data.

We aim to acknowledge serious reports within a few business days.

## Out of scope (examples)

- Model “jailbreaks” that only change a single user’s model output
- Issues that require stolen admin credentials already obtained elsewhere
- Volumetric denial-of-service testing against production without prior written approval
- Requests to publish internal or admin-only API maps

## Key hygiene (for API users)

- Keep keys in environment variables or a secret manager — never in git
- Rotate immediately if a key appeared in chat, a screenshot, or a commit
- Treat any pasted key as compromised
