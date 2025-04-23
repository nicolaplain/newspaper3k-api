FROM python:3.9-slim

# Installiere Systemabhängigkeiten für newspaper3k
RUN apt-get update && apt-get install -y \
    python3-dev build-essential libxml2-dev libxslt-dev \
    libjpeg-dev zlib1g-dev libpng-dev libffi-dev \
    libmagic1 poppler-utils tesseract-ocr libtesseract-dev curl wget \
    && apt-get clean

# Arbeitsverzeichnis setzen
WORKDIR /app

# requirements.txt kopieren und Abhängigkeiten installieren
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# App-Code kopieren
COPY . .

# 🟢 WICHTIG: Flask auf 0.0.0.0:8080 starten
CMD ["python", "app.py"]
