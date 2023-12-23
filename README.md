https://github.com/rabilrbl/gemini-pro-bot  
`.env`
```bash
GOOGLE_API_KEY=AIxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
BOT_TOKEN=123456789:abcdefghijklmnopqrstuvwxyz
```
`docker-compose.yml`
```bash
services:
  gemini:
    image: sheepgreen/gemini
    container_name: gemini
    volumes:
      - ./.env:/gemini/.env
    restart: always
```
