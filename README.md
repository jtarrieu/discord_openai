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

- [Install docker](https://docs.docker.com/engine/install/ubuntu/) :
Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
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
- run the install script: get ready to **paste the tokens**
```bash
./setup.sh
```

