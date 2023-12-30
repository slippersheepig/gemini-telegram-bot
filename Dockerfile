FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/rabilrbl/gemini-pro-bot.git /gemini

FROM python:slim
WORKDIR /gemini
COPY --from=builder /gemini .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py" ]
