# Ask for the tokens
read -p "Enter your Discord bot token: " discord_token
read -p "Enter your OpenAi token: " openai_token

# Permanently set the token as environment variables
echo "export BOT_TOKEN=$discord_token" >> ~/.bashrc
echo "export GPT_KEY=$openai_token" >> ~/.bashrc
source ~/.bashrc

# Creating the container
docker compose up -d
