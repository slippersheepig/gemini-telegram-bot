FROM python:slim AS builder
RUN apt update && apt install git -y
RUN git clone https://github.com/rabilrbl/gemini-pro-bot.git /gemini
RUN pip install --no-cache-dir -r /gemini/requirements.txt

FROM python:alpine
WORKDIR /gemini
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /gemini .

CMD [ "python", "main.py" ]
