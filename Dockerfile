FROM python:slim
WORKDIR /gemini
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "main.py"]
