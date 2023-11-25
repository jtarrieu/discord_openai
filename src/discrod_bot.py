import logging
import responses
import discord
from discord.ext import commands
from credentials import BOT_TOKEN


logging.basicConfig(level=logging.INFO)

intents = discord.Intents.all()
intents.messages = True

bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    logging.info(f'Connecté en tant que {bot.user.name}')

@bot.event
async def on_message(message):

    if message.author.bot:
        return  # Ignore messages from bots, including the bot itself

    # if message.author.name == "TIDE":
    if message.channel.name == "gpt-factory":
        logging.info(f'new request: {str(message.content)}')
        response = f"@{message.author.name}\n\n{responses.answer(message.content)}"
        await message.channel.send(response)

    # Permet au bot de traiter les autres événements
    await bot.process_commands(message)

def run() -> None:
    bot.run(BOT_TOKEN)