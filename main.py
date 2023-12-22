import logging
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters, CallbackContext
from dotenv import load_dotenv
import os
import asyncio

# 导入必要的包
import pathlib
import textwrap

import google.generativeai as genai

# 用于安全地存储API密钥
from google.colab import userdata

from IPython.display import display, Markdown

def to_markdown(text):
    text = text.replace('•', '  *')
    return Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))

# 从 .env 文件加载环境变量
load_dotenv()

# 设置Google API密钥
GOOGLE_API_KEY = os.getenv('GOOGLE_API_KEY')
genai.configure(api_key=GOOGLE_API_KEY)

# 创建 GenerativeModel 实例
model = genai.GenerativeModel('gemini-pro')

# 启用日志记录
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO)

# 处理/start命令的函数
async def start(update, context):
    await update.message.reply_text("你好！我是你的生成式AI聊天机器人。发送给我一个提示，我会生成一个回复。")

# 处理常规消息的函数
async def handle_message(update, context, stream=False):
    user_input = update.message.text
    response = model.generate_content(user_input, stream=stream)

    if stream:
        for chunk in response:
            formatted_chunk = to_markdown(chunk.text)
            await update.message.reply_text(formatted_chunk, parse_mode='Markdown')
    else:
        formatted_response = to_markdown(response.text)
        await update.message.reply_text(formatted_response, parse_mode='Markdown')

# 主函数以运行机器人
async def main():
    # 创建Updater并传递您的机器人令牌
    updater = Updater("BOT_TOKEN", use_context=True)

    # 获取调度程序以注册处理程序
    dp = updater.dispatcher

    # 注册/start命令处理程序
    dp.add_handler(CommandHandler("start", start))

    # 注册用于非命令消息的消息处理程序
    dp.add_handler(MessageHandler(Filters.text & ~Filters.command, lambda update, context: asyncio.run(handle_message(update, context, stream=False))))

    # 启动机器人
    updater.start_polling()

    # 运行机器人直到发送停止信号
    updater.idle()

# 如果脚本被执行，则运行主函数
if __name__ == '__main__':
    asyncio.run(main())
