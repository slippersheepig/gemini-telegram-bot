FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/H-T-H/Gemini-Telegram-Bot.git /gemini

FROM python:slim
WORKDIR /gemini
COPY --from=builder /gemini/config.py /gemini/gemini.py /gemini/handlers.py /gemini/main.py /gemini/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
