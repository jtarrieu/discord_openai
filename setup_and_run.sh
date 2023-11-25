repo_dir="discord_openai"
repo_url="https://github.com/jtarrieu/discord_openai.git"

install_docker () {
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add the repository to Apt sources:
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

start_docker_engine () {
    sudo service docker start
}

install_git () {
    sudo apt-get install git
}

clone_repo () {
    git clone $repo_url -o $repo_dir
}

install_docker
start_docker_engine
install_git
clone_repo

read -p "Enter your Discord bot token: " discord_token
read -p "Enter your OpenAi token: " openai_token

cd $repo_dir

export BOT_TOKEN=$discord_token
export GPT_KEY=$openai_token

# COMPOSING THE CONTAINER
docker compose up -d
