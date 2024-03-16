https://github.com/H-T-H/Gemini-Telegram-Bot  
`docker-compose.yml`
```bash
services:
  gemini:
    image: sheepgreen/gemini
    container_name: gemini
    command: [ "python", "main.py", "TELEGRAM_BOT_API_KEY", "GEMINI_API_KEY" ]
    restart: always
```
