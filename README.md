# OpenAI Discrod bot
This code provide a simple discord bot that queries the OpenAI API.

# Prerequesites
## Discord
### Create a server
- Administrator privileges on a discord server.
### Create a bot
- Create a bot : https://discord.com/developers/applications
### OAuth
- Activate the OAuth.
- Create an URL : *Scopes* -> check *bot*, *bot permissions* -> check admin if you are lazy.
- Click on the invite and add the bot to your server.
## Token
- Generate a token : Click on *reset token* in the Bot section
- Store that token in [***credentials.py***](https://github.com/jtarrieu/tide_server/blob/main/credentials.py)
## OpenAI
- Create an account : https://platform.openai.com/
- Add a payment method : https://platform.openai.com/account/billing/payment-methods
- Generate a token : https://platform.openai.com/api-keys
- Store that token in [***credentials.py***](https://github.com/jtarrieu/tide_server/blob/main/credentials.py)
## Docker
- Install docker : https://docs.docker.com/engine/install/

# Run the bot

```bash
docker compose up
```