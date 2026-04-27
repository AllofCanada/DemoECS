FROM python:3.14-slim-trixie

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY templates/ ./templates/
COPY app.py .

EXPOSE 5001

ENTRYPOINT ["python", "app.py"]