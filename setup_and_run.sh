repo_dir="discord_openai"
repo_url="https://github.com/jtarrieu/discord_openai.git"

install_docker () {
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

# CHECK IF DOCKER IS INSTALLED
if command -v docker &> /dev/null ; then
    echo "Docker is already installed."
else
    echo "Docker is not installed. Installing Docker..."
    install_docker
fi

# CHECK IF DOCKER IS RUNNING
if command -v docker info &> /dev/null ; then
    echo "Docker is running."
else
    echo "Docker is not running. Starting Docker..."
    start_docker_engine
fi

# CHECK IF GIT IS INSTALLED
if command -v git &> /dev/null ; then
    echo "Git is already installed."
else
    echo "Git is not installed. Installing Git..."
    install_git
fi

# CHECK IF THE REPO HAS BEEN CLONED
if [ -d "$repo_dir" ]; then
    echo "Repository is already cloned."
else
    # CLONING THE DISCORD BOT REPO
    clone_repo
fi

# CHECK IF DOCKER IS RUNNING
if  &> /dev/null ; then
    echo "Docker is running."
else
    echo "Docker is not running. Starting Docker..."
    start_docker_engine
fi

read -p "Enter your Discord bot token: " discord_token
read -p "Enter your OpenAi token: " openai_token

cd $repo_dir

echo "BOT_TOKEN = '$discord_token'" >> credentials.py
echo "GPT_KEY = '$openai_token'" >> credentials.py

# COMPOSING THE CONTAINER
docker compose up -d
