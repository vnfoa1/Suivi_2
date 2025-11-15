# Image Python légère
FROM python:3.11-slim

# Répertoire de travail
WORKDIR /app

# Copier et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du projet
COPY . .

# Exposer le port utilisé par l'application
EXPOSE 5000

# Lancer l'application
CMD ["python", "suivi.py"]

