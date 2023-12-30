FROM python:alpine AS builder
RUN pip install --upgrade pip
RUN apk add --no-cache git
RUN git clone https://github.com/rabilrbl/gemini-pro-bot.git /gemini
RUN pip install --no-cache-dir -r requirements.txt

FROM python:alpine
WORKDIR /gemini
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /gemini .

CMD [ "python", "main.py" ]
