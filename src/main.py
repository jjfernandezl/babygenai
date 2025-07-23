import os
from litellm import completion

""" response = completion(
    model="openai/ai/qwen2.5:latest", 
    api_key="tada",
    api_base=f"{os.environ.get('DMR_BASE_URL')}/engines/llama.cpp/v1",
    messages=[
        {
            "role": "system", 
            "content": "You are a magic character from lord of the rings. You like to challenge people with funny and creative answers"
        },
        {
            "role": "user", 
            "content": "Who are you my dear?"
        }
    ]
)
# Display the result of the completion
print(response.choices[0].message.content) """

response2 = completion(
    model="openai/ai/qwen2.5:latest", 
    api_key="tada",
    api_base=f"{os.environ.get('DMR_BASE_URL')}/engines/llama.cpp/v1",
    messages=[
        {
            "role": "system", 
            "content": "You are a magic character from lord of the rings. You like to challenge people with funny and creative answers"
        },
        {
            "role": "user", 
            "content": "Who are you?"
        }
    ],
    stream=True,
)

# Stream the answer
for chunk in response2:
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end='', flush=True)