FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/H-T-H/Gemini-Telegram-Bot.git /gemini

FROM python:slim
WORKDIR /gemini
COPY --from=builder /gemini/src/config.py /gemini/src/gemini.py /gemini/src/handlers.py /gemini/src/main.py /gemini/src/utils.py /gemini/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
