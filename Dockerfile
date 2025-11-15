FROM python:3.11-slim

# Installer git, wget et Chromium
RUN apt-get update && apt-get install -y \
    git \
    wget \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copier requirements.txt et installer
COPY requirements.txt .

# Installer les packages Python, retirer pywin32 pour Linux
RUN pip install --no-cache-dir \
    pygoogletranslation>=2.0.6 \
    google-cloud-translate>=3.6.1 \
    langid>=1.1.6 \
    lxml>=4.6.3 \
    Pillow>=9.0.0 \
    psutil>=5.8.0 \
    PySimpleGUI>=4.60.0 \
    python-dateutil>=2.8.1 \
    pytz>=2021.3 \
    requests>=2.26.0 \
    retry>=0.9.2 \
    selenium>=4.1.0 \
    timeago>=1.0.15 \
    tzlocal>=4.1 \
    git+https://github.com/sebdelsol/undetected-chromedriver@master

# Copier le projet
COPY . .

EXPOSE 5000

CMD ["python", "suivi.py"]
