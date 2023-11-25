import responses
import discord
from credentials import BOT_TOKEN

async def send_message(message, user_message):
    try:
        response = responses.handle_responses(user_message)
        await message.channel.send(response)

    except Exception as e:
        print(e)

def run_discord_bot():

    intents = discord.Intents.all()

    client = discord.Client(intents=intents)

    @client.event
    async def on_ready():
        print(f'{client.user} is now running !')

    @client.event
    async def on_message(message):
        if message.author.bot:
            return

        username = str(message.author)
        user_message = str(message.content)
        channel = str(message.channel)

        print(f"{username} said: {user_message} ({channel})")

        if user_message != "":
            if user_message[0] == '!':
                await send_message(message, user_message)

    print(f'Discord token : {BOT_TOKEN}')
    client.run(BOT_TOKEN)
