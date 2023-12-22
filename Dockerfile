FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/speshiou/gemini-telegram-bot.git /gemini

FROM python:slim
ENV PYTHONUNBUFFERED=1
WORKDIR /gemini
COPY --from=builder /gemini .
RUN mkdir -p /tmp/images
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "bot.py" ]
