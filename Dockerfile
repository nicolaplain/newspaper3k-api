FROM python:3.9-slim

# 🧩 Installiere Systempakete, die newspaper3k benötigt
RUN apt-get update && apt-get install -y \
    libxml2-dev libxslt-dev libjpeg-dev zlib1g-dev libmagic1 \
    python3-dev poppler-utils tesseract-ocr libtesseract-dev \
    build-essential curl wget && \
    apt-get clean

# Arbeitsverzeichnis setzen
WORKDIR /app

# Abhängigkeiten installieren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Code kopieren
COPY . .

# Flask starten auf Port 8080
CMD ["python", "app.py"]
