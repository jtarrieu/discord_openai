read -p "Enter your Discord bot token: " discord_token
read -p "Enter your OpenAi token: " openai_token

cd $repo_dir

export BOT_TOKEN=$discord_token
export GPT_KEY=$openai_token

# COMPOSING THE CONTAINER
docker compose up -d
