FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    libxml2-dev libxslt-dev libjpeg-dev zlib1g-dev libmagic1 python3-dev \
    && apt-get clean

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
