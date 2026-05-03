https://github.com/H-T-H/Gemini-Telegram-Bot  
`docker-compose.yml`
```bash
services:
  gemini:
    image: sheepgreen/gemini #or use ghcr.io/slippersheepig/gemini
    container_name: gemini
    environment:
      - TELEGRAM_BOT_API_KEY="YOUR_TELEGRAM_BOT_API_KEY"
      - GEMINI_API_KEYS="YOUR_GEMINI_API_KEYS"
      - ADMIN_USER_IDS="YOUR_ADMIN_USER_IDS"
    command: [ "python", "main.py" ]
    restart: always
```
