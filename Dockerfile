FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y libgl1 libglib2.0-0 && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir pyTelegramBotAPI aiohttp aiofiles numpy
RUN pip install --no-cache-dir opencv-python-headless
RUN pip install --no-cache-dir ddddocr
COPY . .
EXPOSE 8099
CMD ["python", "bot.py"]
