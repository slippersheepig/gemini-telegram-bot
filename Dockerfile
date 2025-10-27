FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone --depth=1 https://github.com/H-T-H/Gemini-Telegram-Bot.git /gemini

FROM python:slim
WORKDIR /gemini
COPY --from=builder /gemini/src/ .
COPY --from=builder /gemini/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
