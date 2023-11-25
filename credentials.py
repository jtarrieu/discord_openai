"""
This script contains the tokens.
It is empty by default.
Token are added via the setup_and_run.sh script.
If you nedd to change a token, change it here.

Syntaxes:
    OpenAI token  : GPT_KEY = '<token>'
    Discord token : BOT_TOKEN = '<token>'
"""

import os

GPT_KEY = os.getenv('GPT_KEY')
BOT_TOKEN = os.getenv('BOT_TOKEN')
