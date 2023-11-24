from openai import OpenAI
from credentials import GPT_KEY

def handle_responses(message)->str:

    client = OpenAI(api_key=GPT_KEY)

    completion = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[
        {"role": "system", "content": "You are an helpfull assistant."},
        {"role": "user", "content": message}
    ]
    )

    return completion.choices[0].message.content