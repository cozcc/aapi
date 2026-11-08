"""Minimal OpenAI SDK example against AAPI. Set AAPI_API_KEY in the environment."""
import os
from openai import OpenAI

api_key = os.environ.get("AAPI_API_KEY")
if not api_key:
    raise SystemExit("Set AAPI_API_KEY first")

client = OpenAI(
    api_key=api_key,
    base_url=os.environ.get("AAPI_BASE_URL", "https://aapi.ai/v1"),
)

resp = client.chat.completions.create(
    model="deepseek-v4.1-flash",
    messages=[{"role": "user", "content": "ping"}],
)
print(resp.choices[0].message.content)
