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
- **Store the token** 
## OpenAI
- Create an account : https://platform.openai.com/
- Add a payment method : https://platform.openai.com/account/billing/payment-methods
- Generate a token : https://platform.openai.com/api-keys
- **Store the token**
## Docker

- [Install docker](https://docs.docker.com/engine/install/)
## Git
- Install git:
```bash
sudo apt install git
```
# Install
- Clone the repo :
```bash
git clone https://github.com/jtarrieu/discord_openai.git
```
- get inside :
```bash
cd discord_openai
```
- Add the tokens to the **.env** file, **don't modify the variables names**.
- Run the container
```bash
sudo docker compose up -d
```
# Dev
- track logs
```bash
sudo docker compose logs -f
```
