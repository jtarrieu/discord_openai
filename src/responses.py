import logging
from openai import OpenAI
from credentials import GPT_KEY

# Configure the logging settings
logging.basicConfig(level=logging.INFO)

def answer(message: str) -> str:
    # Log the input prompt
    logging.info(f"Input prompt: {message}")

    # Initialize OpenAI client
    client = OpenAI(api_key=GPT_KEY)

    # Make API call
    completion = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[
        {"role": "system", "content": "You are an helpfull assistant."},
        {"role": "user", "content": f'Can you modify the text by  replacing the empty brackets by words ?'},
        {"role": "system", "content": 'Certainly! Please provide me with the text and the words you would like me to replace the empty brackets with.'},
        {"role": "user", "content": message}
    ]
    )

    response = completion.choices[0].message.content
    # Log the API response
    logging.info(f"API response: {response}")

    # Extract and return relevant information
    return completion.choices[0].message.content    
